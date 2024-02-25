import 'package:ecommercecourse/controller/home_controller.dart';
import 'package:ecommercecourse/controller/homescreen_controller.dart';
import 'package:ecommercecourse/view/screens/search_items.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
    // Get.put(TestController());
    return GetBuilder<HomeControllerImp>(
      builder: (controller) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          child: RefreshIndicator(
            onRefresh: () async {
              controller.onInit();
            },
            child: ListView(
              children: [
                CustomSearchBar(
                  onPressedSearch: () {
                    controller.onSearchItem();
                  },
                  myController: controller.search,
                  onChanged: (val) {
                    controller.checkSearch(val);
                  },
                  titleAppBar: "42".tr,
                ),
                HandlingDataView(
                  statusRequest: controller.statusRequest,
                  onOffline: () {
                    controller.onInit();
                  },
                  widget: controller.isSearch == false
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const CustomCardHome(
                                title: "A Summer surprise",
                                body: "CashBack 20%"),
                            CustomTitleHome(
                              title: "40".tr,
                            ),
                            const ListCategoriesHome(),
                            CustomTitleHome(title: "41".tr),
                            const ListItemsHome(),
                          ],
                        )
                      : GridViewSearchItems(
                          controller: HomeScreenControllerImp(),
                          dataSearch: controller.dataSearch,
                          statusRequest: controller.statusRequest,
                        ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
