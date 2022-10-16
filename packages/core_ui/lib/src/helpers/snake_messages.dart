import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

void snakeErro(String erro, [StackTrace? stackTrace]) {
  print(erro);
  if (stackTrace != null) print(stackTrace.toString());
  BuildContext? context = AppContainer.get();
  if (context == null) return;
  ScaffoldMessenger.of(context).removeCurrentSnackBar();
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(erro),
    duration: Duration(seconds: 3),
  ));
}
