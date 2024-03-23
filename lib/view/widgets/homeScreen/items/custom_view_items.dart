// ignore_for_file: avoid_print

import 'package:ecommercecourse/data/model/items_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/favorite_controller.dart';
import '../../../../core/class/status_request.dart';
import 'custom_list_items.dart';

class GridViewItems<T extends GetxController> extends StatelessWidget {
  const GridViewItems(
      {super.key,
      required this.controller,
      required this.statusRequest,
      required this.data});
  final T controller;
  final StatusRequest statusRequest;
  final List<ItemsModel> data;
  @override
  Widget build(BuildContext context) {
    ItemsModel itemsModel;
    FavoriteControllerImp controllerFav = Get.put(FavoriteControllerImp());
    // TODO: implement build

    return GridView.builder(
        itemCount: data.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 0.7),
        itemBuilder: (BuildContext context, index) {
          itemsModel = data[index];
          controllerFav.setFavorite(itemsModel.itemsId, itemsModel.favorite);
          print("Is Favorite Values : ${controllerFav.isFavorite} ");
          return CustomListItems(
            itemsModel: itemsModel,
          );
        });
  }
}
