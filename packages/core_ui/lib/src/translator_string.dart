extension TranslatorString on String {
  String get trs {
    return translator(this);
  }

  String trsArgs(List<String> args) {
    return translatorArgs(this, args);
  }

  static late String Function(String str) translator;
  static late String Function(String str, List<String> args) translatorArgs;
}
