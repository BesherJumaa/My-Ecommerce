import 'package:ecommercecourse/view/screens/homeScreens/home.dart';
import 'package:ecommercecourse/view/screens/homeScreens/myfavorite.dart';
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
    const MyFavorite(),
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(child: Text("46".tr)),
      ],
    ),
    const Settings(),
  ];

  List bottomAppBar = [
    {
      "title": "43".tr,
      "icon": Icons.home_outlined,
    },
    {
      "title": "45".tr,
      "icon": Icons.favorite_border_outlined,
    },
    {
      "title": "46".tr,
      "icon": Icons.person_2_outlined,
    },
    {
      "title": "44".tr,
      "icon": Icons.settings_outlined,
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
