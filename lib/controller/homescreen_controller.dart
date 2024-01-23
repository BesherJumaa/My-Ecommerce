import 'package:ecommercecourse/view/screens/homeScreens/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class HomeScreenController extends GetxController {
  changePage(int i);
}

class HomeScreenControllerImp extends HomeScreenController {
  int currentPage = 0;
  late PageController pageController;
  List<Widget> listPage = [
    const HomePage(),
    const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(child: Text("Settings")),
      ],
    ),
    const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(child: Text("Favorite")),
      ],
    ),
    const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(child: Text("Profile")),
      ],
    ),
    const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(child: Text("Home")),
      ],
    ),
  ];

  @override
  void onInit() {
    pageController = PageController(initialPage: currentPage);
    super.onInit();
  }

  @override
  changePage(int i) {
    currentPage = i;
    pageController.animateToPage(
      i,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
    update();
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
