import 'package:flutter/cupertino.dart';

class ActionData {
  String name;
  IconData icon;
  void Function() action;

  ActionData(this.name, this.icon, this.action);
}
