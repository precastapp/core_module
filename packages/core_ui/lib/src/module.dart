import 'action_data.dart';
import 'route_page.dart';

class Module {
  String name;
  List<String> rules;
  List<ActionData> mainActionMenu;
  List<ActionData> leadingActionMenu;
  List<RoutePage> routes;

  Module(
      {required this.name,
      this.rules = const [],
      this.mainActionMenu = const [],
      this.leadingActionMenu = const [],
      this.routes = const []});
}
