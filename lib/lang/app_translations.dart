import 'dart:async';
import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class AppTranslations {
  Locale locale;
  static Map<dynamic, dynamic> _localisedValues;

  AppTranslations(Locale locale) {
    this.locale = locale;
  }

  static AppTranslations of(BuildContext context) {
    return Localizations.of<AppTranslations>(context, AppTranslations);
  }

  static Future<AppTranslations> load(Locale locale) async {
    AppTranslations appTranslations = AppTranslations(locale);
    print(
        'locale ${locale.languageCode}  scriptCode ${locale.scriptCode} countryCode ${locale.countryCode}');
    String langPackage = locale.languageCode;
    /* if (locale.languageCode == 'zh' &&
        locale.countryCode != 'CN' &&
        locale.countryCode != null) {
      langPackage += '-Hant';
    } */
    print('langPackage=$langPackage');
    String jsonContent =
        await rootBundle.loadString("locale/$langPackage.json");
    _localisedValues = json.decode(jsonContent);
    return appTranslations;
  }

  get currentLanguage => locale.languageCode;

  String text(String key) {
    return _localisedValues[key] ?? "$key not found";
  }

  String t(String key) {
    return _localisedValues[key] ?? "$key";
  }
}
