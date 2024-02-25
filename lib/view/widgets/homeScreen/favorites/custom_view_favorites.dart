// ignore_for_file: avoid_print

import 'package:ecommercecourse/controller/myfavorite_controller.dart';
import 'package:ecommercecourse/core/class/handlingdataview.dart';
import 'package:ecommercecourse/data/model/items_model.dart';
import 'package:ecommercecourse/data/model/myfavorite_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../controller/favorite_controller.dart';

import 'custom_list_favorite.dart';

class GridViewFavorites extends StatelessWidget {
  const GridViewFavorites({super.key});

  @override
  Widget build(BuildContext context) {
    MyFavoriteModel itemsModel;

    FavoriteControllerImp controllerFav = Get.put(FavoriteControllerImp());

    // TODO: implement build
    return GetBuilder<MyFavoriteControllerImp>(builder: (controller) {
      return HandlingDataView(
        statusRequest: controller.statusRequest,
        widget: GridView.builder(
            itemCount: controller.data.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, childAspectRatio: 0.7),
            itemBuilder: (BuildContext context, index) {
              itemsModel = controller.data[index];
              controllerFav.setFavorite(
                  itemsModel.itemsId, itemsModel.favoriteId);
              print("Is Favorite Values : ${controllerFav.isFavorite} ");
              return CustomListFavorites(
                onTapCard: () {
                  controller.goToProductDetails(itemsModel as ItemsModel);
                },
                itemsModel: itemsModel,
              );
            }),
      );
    });
  }
}
