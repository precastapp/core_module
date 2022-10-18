import 'dart:io';

import 'package:jose/jose.dart';
import 'package:shelf/shelf.dart';
import 'package:domain_core/domain_core.dart';
import 'package:http/http.dart' as http;

class AuthorizeController {
  JsonWebKeyStore? _rsaPublicKey;

  Middleware call() => (innerHandler) {
        return (request) async {
          final authorizationHeader = request.headers['Authorization'] ??
              request.headers['authorization'];

          if (authorizationHeader == null)
            return Response(401, body: 'Authorization header not found');

          final token = authorizationHeader
            .substring(authorizationHeader.indexOf(' '))
            .trim();

          if (token.isEmpty)
            return Response(401, body: 'Authorization token is empty');

          var jwt = JsonWebToken.unverified(token);
          if (false && !await jwt.verify(await getRsaPublicKey()))
            return Response(401, body: 'Authorization token is no a valid jwt');

          request = request.change(context: {
            'user_id': jwt.claims['sub'],
            'scope': (jwt.claims['scope'] as String).split(' ')
          });

          return Future.sync(() => innerHandler(request)).then((response) {
            return response;
          });
        };
      };

  Future<JsonWebKeyStore> getRsaPublicKey() async {
    if (_rsaPublicKey != null) return _rsaPublicKey!;
    var url = Platform.environment['RSA_PUBLIC_KEY_URL'];
    if (url == null) return Future.error('RSA_PUBLIC_KEY_URL not set');
    var response = await http.get(Uri.parse(url));
    if (response.statusCode != 200) return Future.error(response.body);

    var lines = response.body.split('\n');
    lines.removeAt(0);
    lines.removeAt(lines.length - 1);

    _rsaPublicKey = JsonWebKeyStore()
      ..addKey(JsonWebKey.fromJson(
          {"kty": "oct", "k": lines.map((e) => e.trim()).join()}));
    return _rsaPublicKey!;
  }
}
