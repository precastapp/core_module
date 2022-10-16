import 'package:flutter/material.dart';

class RoutePage {
  String route;
  Widget Function() page;

  RoutePage(this.route, this.page);
}
