import 'package:ecommercecourse/controller/items_controller.dart';
import 'package:ecommercecourse/core/class/handlingdataview.dart';
import 'package:ecommercecourse/view/widgets/custom_app_bar.dart';
import 'package:ecommercecourse/view/widgets/homeScreen/home/customappbar.dart';
import 'package:ecommercecourse/view/screens/search_items.dart';
import 'package:ecommercecourse/view/widgets/homeScreen/items/custom_view_items.dart';
import 'package:ecommercecourse/view/widgets/homeScreen/items/list_categories_items.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/favorite_controller.dart';

class Items extends StatelessWidget {
  const Items({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ItemsControllerImp());
    FavoriteControllerImp controllerFav = Get.put(FavoriteControllerImp());
    Get.put(SearchController());
    return Scaffold(
      appBar: const CustomAppBarHome(),
      body: GetBuilder<ItemsControllerImp>(builder: (controller) {
        return RefreshIndicator(
          onRefresh: () async {
            controller.initialData();
            // controllerFav.onInit();
            controllerFav.update();
          },
          child: ListView(children: [
            CustomSearchBar(
              myController: controller.search,
              onPressedSearch: () {
                controller.onSearchItem();
              },
              onChanged: (val) {
                controller.checkSearch(val);
              },
              titleAppBar: "42".tr,
            ),
            controller.isSearch == false
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      const ListCategoriesItems(),
                      HandlingDataView(
                        width: 200,
                        height: 230,
                        statusRequest: controller.statusRequest,
                        widget: GridViewItems(
                          controller: ItemsControllerImp(),
                          statusRequest: controller.statusRequest,
                          data: controller.data,
                        ),
                      ),
                    ],
                  )
                : GridViewSearchItems(
                    controller: ItemsControllerImp(),
                    statusRequest: controller.statusRequest,
                    dataSearch: controller.dataSearch,
                  ),
            // Container(
            //     child: Text("NO"),
            //   )
          ]),
        );
      }),
    );
  }
}
