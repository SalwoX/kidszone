import 'package:flutter/material.dart';

class LanguageManager {
  static const TR_LOCALE = Locale("tr", "TR");
  static const EN_LOCALE = Locale("en", "US");
  static const LANG_PATH = "resources/langs";

  static const SUPPORTED_LOCALE = [
    LanguageManager.EN_LOCALE,
    LanguageManager.TR_LOCALE,
  ];
/*     LanguageManager.EN_LOCALE,
    LanguageManager.DE_LOCALE,
    LanguageManager.ES_LOCALE, */

  /*  static LanguageManager? _instance;
  static LanguageManager get instance {
    _instance ?? = LanguageManager._init();
    return _instance!;
  }

  LanguageManager._init();

  final enLocale = const Locale('en', 'US');
  final trLocale = const Locale('tr', 'TR');

  List<Locale> get supportedLocales => [enLocale, trLocale]; */
}
