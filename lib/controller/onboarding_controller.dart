import 'package:ecommercecourse/core/constant/routes.dart';
import 'package:ecommercecourse/core/services/services.dart';
import 'package:ecommercecourse/data/datasource/static/static.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class OnBoardingController extends GetxController {
  next();
  onPageChanged(int index);
}

class OnBoardingControllerImp extends OnBoardingController {
  late PageController pageController;

  int currentPage = 0;
  MyServices myServices = Get.find();
  @override
  @override
  next() {
    if (currentPage >= onBoardingList.length - 1) {
      myServices.sharedPreferences.setString("step", "1");
      Get.offAllNamed(AppRoutes.login);
    } else {
      currentPage++;
      pageController.animateToPage(
        currentPage,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeIn,
      );
      onPageChanged(currentPage);
    }
    update();
  }

  @override
  onPageChanged(int index) {
    // TODO: implement onPageChanged
    currentPage = index;
    update();
    throw UnimplementedError();
  }

  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }
}
