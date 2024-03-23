import 'package:ecommercecourse/controller/myfavorite_controller.dart';
import 'package:ecommercecourse/core/class/handlingdataview.dart';
import 'package:ecommercecourse/view/widgets/custom_app_bar.dart';
import 'package:ecommercecourse/view/widgets/homeScreen/favorites/custom_view_favorites.dart';
import 'package:ecommercecourse/view/screens/search_items.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyFavorite extends StatelessWidget {
  const MyFavorite({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MyFavoriteControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: Text("45".tr),
      ),
      // appBar: const CustomAppBarHome(),
      body: GetBuilder<MyFavoriteControllerImp>(builder: (controller) {
        return RefreshIndicator(
          onRefresh: () async {
            return controller.initialData();
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

            HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: controller.isSearch == false
                    ? const Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          GridViewFavorites(),
                        ],
                      )
                    : GridViewSearchItems(
                        controller: MyFavoriteControllerImp(),
                        statusRequest: controller.statusRequest,
                        dataSearch: controller.dataSearch,
                      ))

            // const ListCategoriesItems(),
          ]),
        );
      }),
    );
  }
}
