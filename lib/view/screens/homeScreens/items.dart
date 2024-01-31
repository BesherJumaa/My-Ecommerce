import 'package:ecommercecourse/controller/items_controller.dart';
import 'package:ecommercecourse/view/widgets/custom_app_bar.dart';
import 'package:ecommercecourse/view/widgets/homeScreen/home/customappbar.dart';
import 'package:ecommercecourse/view/widgets/homeScreen/items/custom_view_items.dart';
import 'package:ecommercecourse/view/widgets/homeScreen/items/list_categories_items.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/favorite_controller.dart';

class Items extends StatelessWidget {
  const Items({super.key});

  @override
  Widget build(BuildContext context) {
    ItemsControllerImp controller = Get.put(ItemsControllerImp());
    FavoriteControllerImp controllerFav = Get.put(FavoriteControllerImp());
    return Scaffold(
      appBar: const CustomAppBarHome(),
      body: RefreshIndicator(
        onRefresh: () async {
          controller.initialData();
          // controllerFav.onInit();
          controllerFav.update();
        },
        child: ListView(children: [
          CustomSearchBar(
            titleAppBar: "42".tr,
          ),
          const SizedBox(
            height: 20,
          ),
          const ListCategoriesItems(),
          const GridViewItems(),
        ]),
      ),
    );
  }
}
