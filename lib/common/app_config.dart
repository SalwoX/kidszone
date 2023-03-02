import 'package:flutter/foundation.dart';

const String SuffixUrl = kReleaseMode ? "" : "";
const String ApiUrl = kReleaseMode ? "" : "";
const String SocketUrl = kReleaseMode ? "" : "";
const String Prefix = kReleaseMode ? "https://" : "https://";

class AppConfig {
  static int pageSize = 20;
}
