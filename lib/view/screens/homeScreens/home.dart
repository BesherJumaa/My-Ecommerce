import 'package:ecommercecourse/controller/home_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../../controller/test_controlller.dart';
import '../../../core/class/handlingdataview.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/homeScreen/home/custom_card_home.dart';
import '../../widgets/homeScreen/home/custom_title_home.dart';
import '../../widgets/homeScreen/home/list_categories_home.dart';
import '../../widgets/homeScreen/home/list_items_home.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());
    Get.put(TestController());
    return GetBuilder<HomeControllerImp>(
      builder: (controller) {
        return HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: Container(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            child: ListView(
              children: const [
                CustomSearchBar(
                  titleAppBar: "Find Product",
                ),
                CustomCardHome(
                    title: "A Summer surprise", body: "CashBack 20%"),
                CustomTitleHome(
                  title: "Categories",
                ),
                ListCategoriesHome(),
                CustomTitleHome(title: "Products For You "),
                ListItemsHome(),
              ],
            ),
          ),
        );
      },
    );
  }
}
