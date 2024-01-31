import 'package:ecommercecourse/controller/home_controller.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../controller/test_controlller.dart';
import '../../../core/class/handlingdataview.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/homeScreen/home/custom_card_home.dart';
import '../../widgets/homeScreen/home/custom_title_home.dart';
import '../../widgets/homeScreen/home/list_categories_home.dart';
import '../../widgets/homeScreen/home/list_items_home.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

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
            child: RefreshIndicator(
              onRefresh: () async {
                controller.initialData();
              },
              child: ListView(
                children: [
                  CustomSearchBar(
                    titleAppBar: "42".tr,
                  ),
                  const CustomCardHome(
                      title: "A Summer surprise", body: "CashBack 20%"),
                  CustomTitleHome(
                    title: "40".tr,
                  ),
                  const ListCategoriesHome(),
                  CustomTitleHome(title: "41".tr),
                  const ListItemsHome(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
