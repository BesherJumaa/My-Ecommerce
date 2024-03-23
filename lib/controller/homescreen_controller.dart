import 'package:ecommercecourse/view/screens/homeScreens/home.dart';
import 'package:ecommercecourse/view/screens/offers.dart';
import 'package:ecommercecourse/view/screens/orders/pending.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../view/screens/settings.dart';

abstract class HomeScreenController extends GetxController {
  changePage(int i);
}

class HomeScreenControllerImp extends HomeScreenController {
  int currentPage = 0;
  late PageController pageController;
  List<Widget> listPage = [
    const HomePage(),
    const Offers(),
    const OrdersPending(),
    const Settings(),
  ];

  List bottomAppBar = [
    {
      "title": "43".tr,
      "icon": Icons.home,
    },
    {
      "title": "133".tr,
      "icon": Icons.sell,
    },
    {
      "title": "114".tr,
      "icon": Icons.delivery_dining,
    },
    {
      "title": "44".tr,
      "icon": Icons.settings,
    }
  ];

  @override
  void onInit() {
    pageController = PageController(initialPage: currentPage);
    super.onInit();
  }

  @override
  changePage(int i) {
    currentPage = i;

    update();
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
