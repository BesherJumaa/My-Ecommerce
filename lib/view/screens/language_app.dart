// ignore_for_file: deprecated_member_use, avoid_print

import 'package:ecommercecourse/core/constant/routes.dart';
import 'package:ecommercecourse/core/localization/changelocal.dart';
import 'package:ecommercecourse/view/widgets/language/custombuttomlang.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LanguageApp extends GetView<LocaleController> {
  const LanguageApp({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "1".tr,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 30),
            CustomButtonLang(
                textButton: "ar".tr,
                onPressed: () {
                  print("pressed");
                  controller.changeLang("ar");
                  Get.offNamed(AppRoutes.homePage);
                }),
            CustomButtonLang(
                textButton: "en".tr,
                onPressed: () {
                  print("pressed");
                  controller.changeLang("en");

                  Get.offAndToNamed(AppRoutes.homePage);
                }),
          ],
        ),
      ),
    );
  }
}
