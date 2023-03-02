class ProjectLogger {
  static ProjectLogger? _instance;
  static ProjectLogger get instance {
    _instance ??= ProjectLogger._init();
    return _instance!;
  }

  ProjectLogger._init();

  void logClassName<T>(T page) {
    print(page.toString());
  }
}
