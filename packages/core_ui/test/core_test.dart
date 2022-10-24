import 'package:core_ui/core_ui.dart';
import 'package:test/test.dart';

void main() {
  group('A group of tests', () {
    setUp(() {
      // Additional setup goes here.
    });

    test('First Test', () {
      var entity = Entity()..id = 'asdf';
      var json = entity.toJson();
      expect(entity.createdAt, json['createdAt']);
    });
  });
}
