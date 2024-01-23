import 'package:ecommercecourse/controller/home_controller.dart';
import 'package:ecommercecourse/controller/homescreen_controller.dart';
import 'package:ecommercecourse/view/widgets/homeScreen/customBottomappBarButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../widgets/homeScreen/home/customappbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenControllerImp());
    Get.put(HomeControllerImp());

    return GetBuilder<HomeScreenControllerImp>(
      builder: (controller) {
        return Scaffold(
          appBar: const CustomAppBarHome(),
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            child: const Icon(Icons.shopping_basket_outlined),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          bottomNavigationBar: BottomAppBar(
              shape: const CircularNotchedRectangle(),
              notchMargin: 10,
              child: Row(
                children: [
                  Row(
                    children: [
                      CustomBottomAppBarButton(
                        title: "Home",
                        icon: Icons.home_outlined,
                        onPressed: () {
                          controller.changePage(0);
                        },
                        active: controller.currentPage == 0 ? true : false,
                      ),
                      CustomBottomAppBarButton(
                        title: "Settings",
                        icon: Icons.settings_outlined,
                        onPressed: () {
                          controller.changePage(1);
                        },
                        active: controller.currentPage == 1 ? true : false,
                      ),
                    ],
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      CustomBottomAppBarButton(
                        title: "Favorite",
                        icon: Icons.favorite_border_outlined,
                        onPressed: () {
                          controller.changePage(2);
                        },
                        active: controller.currentPage == 2 ? true : false,
                      ),
                      CustomBottomAppBarButton(
                        title: "Profile",
                        icon: Icons.person_2_outlined,
                        onPressed: () {
                          controller.changePage(3);
                        },
                        active: controller.currentPage == 3 ? true : false,
                      ),
                    ],
                  ),
                ],
              )),
          body: PageView(
            controller: controller.pageController,
            onPageChanged: (index) {
              controller.changePage(index);
            },
            children: controller.listPage,
          ),
        );
      },
    );
  }
}
