import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../shared/helpers/locale_helper.dart';

class LocaleCubit extends Cubit<Locale> {
  LocaleCubit(super.def);

  void changeLocale(Locale locale) {
    LocaleHelper.saveCurrentLocale(locale)
        .then((value) {
          emit(locale);
        })
        .catchError((error) {});
  }

  bool isArabic() {
    return state.languageCode == SupportedLocaleCodes.ar.name;
  }

  bool isEnglish() {
    return state.languageCode == SupportedLocaleCodes.en.name;
  }
}
