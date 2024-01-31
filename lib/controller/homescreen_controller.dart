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
    const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(child: Text("Profile")),
      ],
    ),
    const Settings(),
  ];

  List bottomAppBar = [
    {
      "title": "home",
      "icon": Icons.home_outlined,
    },
    {
      "title": "favorite",
      "icon": Icons.favorite_border_outlined,
    },
    {
      "title": "profile",
      "icon": Icons.person_2_outlined,
    },
    {
      "title": "settings",
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
