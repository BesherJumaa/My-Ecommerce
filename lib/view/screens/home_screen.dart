import 'package:ecommercecourse/controller/home_controller.dart';
import 'package:ecommercecourse/controller/homescreen_controller.dart';
import 'package:ecommercecourse/core/constant/routes.dart';
import 'package:ecommercecourse/view/cart/cart.dart';
import 'package:ecommercecourse/view/widgets/homeScreen/customBottomAppBarHome.dart';
import 'package:ecommercecourse/view/widgets/homeScreen/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/constant/color.dart';
import '../../core/functions/alert_exit_app.dart';
import '../widgets/homeScreen/home/customappbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenControllerImp());
    Get.put(HomeControllerImp());

    return GetBuilder<HomeScreenControllerImp>(
      builder: (controller) {
        return WillPopScope(
          onWillPop: () => alertExitApp(),
          child: Scaffold(
            appBar: const CustomAppBarHome(),
            drawer: const CustomDrawer(),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                // Get.toNamed(
                //   AppRoutes.cart,
                // );
                Get.to(Cart(),
                    transition: Transition.downToUp,
                    duration: Duration(seconds: 1));
              },
              child: const Icon(
                Icons.shopping_cart_outlined,
                color: AppColor.backGroundColor,
              ),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            bottomNavigationBar: const CustomBottomAppBarHome(),
            body: controller.listPage.elementAt(controller.currentPage),
          ),
        );
      },
    );
  }
}
