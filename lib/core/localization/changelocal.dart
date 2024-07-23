import 'package:ecommercecourse/core/functions/fbmconfig.dart';
import 'package:ecommercecourse/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

import '../constant/apptheme.dart';

class LocaleController extends GetxController {
  Locale? language;
  MyServices myServices = Get.find();

  ThemeData appTheme = themeEnglish;

  changeLang(String langcode) async {
    Locale locale = Locale(langcode);
    myServices.sharedPreferences.setString("lang", langcode);
    appTheme = langcode == "ar" ? themeArabic : themeEnglish;
    await Jiffy.setLocale(langcode == "ar" ? 'ar' : 'en');
    Get.updateLocale(locale);
    Get.changeTheme(appTheme);
  }

  @override
  void onInit() async {
    super.onInit();
    requestPermissionNotifications();
    fbmConfig();
    String? sharedPrefLang = myServices.sharedPreferences.getString("lang");
    if (sharedPrefLang == "ar") {
      language = const Locale("ar");
      await Jiffy.setLocale('ar');

      appTheme = themeArabic;
    } else if (sharedPrefLang == "en") {
      language = const Locale("en");
      await Jiffy.setLocale('en');
      appTheme = themeEnglish;
    } else {
      await Jiffy.setLocale('en');
      language = Locale(Get.deviceLocale!.languageCode);
      appTheme = themeEnglish;
    }
  }
}
