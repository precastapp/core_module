class AppContainer {
  static late T Function<T>(T object) add;
  static late T Function<T>() get;
  static late void Function<T>(T Function(), {String? tag, bool fenix}) addLazy;
  static late Future<bool> Function<S>({bool force, String? tag}) delete;
}
