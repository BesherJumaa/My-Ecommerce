import 'package:ecommercecourse/controller/home_controller.dart';
import 'package:ecommercecourse/controller/homescreen_controller.dart';
import 'package:ecommercecourse/view/widgets/homeScreen/customBottomAppBarHome.dart';

import 'package:ecommercecourse/view/widgets/homeScreen/customBottomappBarButton.dart';
import 'package:ecommercecourse/view/widgets/homeScreen/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/functions/alertexitapp.dart';
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
              onPressed: () {},
              child: const Icon(Icons.shopping_basket_outlined),
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
