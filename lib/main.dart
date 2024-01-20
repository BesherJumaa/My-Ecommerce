import 'package:ecommercecourse/core/localization/changelocal.dart';
import 'package:ecommercecourse/core/services/services.dart';
import 'package:ecommercecourse/routes.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'binding/initinalbinding.dart';
import 'core/localization/translation.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    LocaleController controller = Get.put(LocaleController());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      locale: controller.language,
      title: 'Ecommerce ',
      translations: MyTranslation(),
      theme: controller.appTheme,
      // routes: routes,
      getPages: routes,
      initialBinding: InitialBindings(),
    );
  }
}
