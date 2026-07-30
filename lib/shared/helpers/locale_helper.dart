import 'package:flutter/material.dart';
import 'package:jarir_bookstore_project/core/values/strings.dart';

import 'shared_preferences_helper.dart';

enum SupportedLocaleCodes { en, ar }

class LocaleHelper {
  static final Locale _defaultLocale = Locale(SupportedLocaleCodes.en.name);

  static Locale getDefaultLocale() {
    return _defaultLocale;
  }

  static List<Locale> getSupportedLocales() {
    return List.generate(
      SupportedLocaleCodes.values.length,
      (index) => Locale(SupportedLocaleCodes.values[index].name),
    );
  }

  static Locale getCurrentLocale() {
    String lang =
        SharedPreferencesHelper.instance.getString(langKey) ??
        _defaultLocale.languageCode;
    return Locale(lang);
  }

  static Future<bool> saveCurrentLocale(Locale arg) {
    return SharedPreferencesHelper.instance.setString(
      langKey,
      arg.languageCode,
    );
  }

  static Locale toggle(Locale currentLocale) {
    if (currentLocale.languageCode == SupportedLocaleCodes.en.name) {
      return Locale(SupportedLocaleCodes.ar.name);
    }
    return Locale(SupportedLocaleCodes.en.name);
  }
}
