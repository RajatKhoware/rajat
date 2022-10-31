import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tambola_frontend/controller/lang/bn_IN.dart';
import 'package:tambola_frontend/controller/lang/en_US.dart';
import 'package:tambola_frontend/controller/lang/gu_IN.dart';
import 'package:tambola_frontend/controller/lang/hi_IN.dart';
import 'package:tambola_frontend/controller/lang/ma_IN.dart';
import 'package:tambola_frontend/controller/lang/ml_IN.dart';
import 'package:tambola_frontend/controller/lang/ta_IN.dart';
import 'package:tambola_frontend/controller/lang/te_IN.dart';
// import 'package:get_storage/get_storage.dart';
// import 'package:tambola_frontend/lang/bn_IN.dart';
// import 'package:tambola_frontend/lang/en_US.dart';
// import 'package:tambola_frontend/lang/gu_IN.dart';
// import 'package:tambola_frontend/lang/hi_IN.dart';
// // import 'package:tambola_frontend/lang/hi_in.dart';
// import 'package:tambola_frontend/lang/ma_IN.dart';
// import 'package:tambola_frontend/lang/ta_IN.dart';
// import 'package:tambola_frontend/lang/te_IN.dart';

class LocalizationService extends Translations {
  static final local = Locale("en", "US");
  static final fallBackLocale = Locale('en', 'US');

  static final langs = [
    'English'.tr,
    'Hindi'.tr,
    'Marathi'.tr,
    'Bengali'.tr,
    'Tamil'.tr,
    'Telugu'.tr,
    'Gujarati'.tr,
    'Malayalam'.tr,
  ];
  static final locales = [
    Locale('en', 'US'),
    Locale('hi', 'IN'),
    Locale('mr', 'IN'),
    Locale('bn', 'IN'),
    Locale('ta', 'IN'),
    Locale('te', 'IN'),
    Locale('gu', 'IN'),
    Locale('ml', 'IN'),
  ];

  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': enUS,
        'hi_IN': hiIN,
        "mr_IN": mrIN,
        "bn_IN": bnIN,
        "ta_IN": taIN,
        "te_IN": teIN,
        "gu_IN": guIN,
        "ml_IN": mlIN,
      };

  void changeLocale(String lang) {
    final locale = getLocaleFromLanguage(lang);
    final box = GetStorage();
    box.write("language", lang);
    Get.updateLocale(locale!);
  }

  Locale? getLocaleFromLanguage(String lang) {
    for (int i = 0; i < langs.length; i++) {
      if (lang == langs[i]) return locales[i];
    }
    return Get.locale!;
  }

  Locale getCurrentLocale() {
    final box = GetStorage();
    Locale defaultLocale;

    if (box.read('language') != null) {
      final locale = getLocaleFromLanguage(box.read('language'));
      defaultLocale = locale!;
    } else {
      defaultLocale = Locale('en', "US");
    }
    return defaultLocale;
  }

  String getCurrentLang() {
    final box = GetStorage();
    return box.read("language") != null ? box.read("language") : 'English';
  }
}
