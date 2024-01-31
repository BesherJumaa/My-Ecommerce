import 'package:ecommercecourse/controller/myfavorite_controller.dart';
import 'package:ecommercecourse/view/widgets/custom_app_bar.dart';
import 'package:ecommercecourse/view/widgets/homeScreen/favorites/custom_view_favorites.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyFavorite extends StatelessWidget {
  const MyFavorite({super.key});

  @override
  Widget build(BuildContext context) {
    MyFavoriteControllerImp controller = Get.put(MyFavoriteControllerImp());
    return Scaffold(
      // appBar: const CustomAppBarHome(),
      body: RefreshIndicator(
        onRefresh: () async {
          return controller.initialData();
        },
        child: ListView(children: [
          CustomSearchBar(
            titleAppBar: "42".tr,
          ),

          const SizedBox(
            height: 20,
          ),
          // const ListCategoriesItems(),
          const GridViewFavorites(),
        ]),
      ),
    );
  }
}
