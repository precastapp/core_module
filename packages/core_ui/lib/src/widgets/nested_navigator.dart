import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../page_manager.dart';

typedef Widget NestedRouteBuilder(PageManager);

class NestedNavigator extends StatelessWidget with PageManager {
  final GlobalKey<NavigatorState> navigationKey;
  final Map<String, NestedRouteBuilder> routes;

  NestedNavigator({
    required this.navigationKey,
    required this.routes,
  });

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Navigator(
        key: navigationKey,
        onGenerateRoute: (RouteSettings routeSettings) {
          NestedRouteBuilder builder = routes[routeSettings.name]!;
          return PageRouteBuilder(
            pageBuilder: (context, __, ___) => builder(this),
            settings: routeSettings,
          );
        },
      ),
      onWillPop: () {
        if (navigationKey.currentState!.canPop()) {
          navigationKey.currentState!.pop();
          return Future<bool>.value(false);
        }
        return Future<bool>.value(true);
      },
    );
  }

  @override
  void back<T>([T? result]) {
    navigationKey.currentState!.pop(result);
  }

  @override
  void dialog(Widget Function() builder) {
    navigationKey.currentState!
        .push(MaterialPageRoute(builder: (c) => builder()));
  }

  @override
  void toRoute(String route, {bool clearStack = false}) {
    navigationKey.currentState!.pushNamed(route);
  }
}
