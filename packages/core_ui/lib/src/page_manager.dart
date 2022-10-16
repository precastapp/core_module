import 'package:flutter/widgets.dart';

abstract class PageManager {
  void toRoute(String route, {bool clearStack = false});
  void back<T>([T? result]);
  void dialog(Widget Function() builder);
}
