// ignore_for_file: avoid_print

import 'package:ecommercecourse/core/class/handlingdataview.dart';
import 'package:ecommercecourse/data/model/items_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/favorite_controller.dart';
import '../../../../controller/items_controller.dart';
import 'custom_list_items.dart';

class GridViewItems extends StatelessWidget {
  const GridViewItems({super.key});

  @override
  Widget build(BuildContext context) {
    ItemsModel itemsModel;
    FavoriteControllerImp controllerFav = Get.put(FavoriteControllerImp());
    // TODO: implement build
    return GetBuilder<ItemsControllerImp>(builder: (controller) {
      return HandlingDataView(
        statusRequest: controller.statusRequest,
        widget: GridView.builder(
            itemCount: controller.data.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, childAspectRatio: 0.7),
            itemBuilder: (BuildContext context, index) {
              itemsModel = ItemsModel.fromJson(controller.data[index]);
              controllerFav.setFavorite(
                  itemsModel.itemsId, itemsModel.favorite);
              print("Is Favorite Values : ${controllerFav.isFavorite} ");
              return CustomListItems(
                itemsModel: itemsModel,
              );
            }),
      );
    });
  }
}
