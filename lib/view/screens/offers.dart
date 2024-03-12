import 'package:ecommercecourse/controller/offers_controller.dart';
import 'package:ecommercecourse/view/screens/search_items.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/class/handlingdataview.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/homeScreen/items/custom_view_items.dart';

class Offers extends StatelessWidget {
  const Offers({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OffersController());
    // TODO: implement build
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: GetBuilder<OffersController>(builder: (controller) {
          return RefreshIndicator(
            onRefresh: () async {
              controller.getData();
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
                const SizedBox(
                  height: 20,
                ),
                controller.isSearch == false
                    ? HandlingDataView(
                        statusRequest: controller.statusRequest,
                        onOffline: () {
                          controller.onInit();
                        },
                        widget: GridViewItems(
                          controller: OffersController(),
                          statusRequest: controller.statusRequest,
                          data: controller.data,
                        ),
                      )
                    : GridViewSearchItems(
                        controller: OffersController(),
                        statusRequest: controller.statusRequest,
                        dataSearch: controller.dataSearch,
                      ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
