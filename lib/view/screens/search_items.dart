// ignore_for_file: avoid_print

import 'package:ecommercecourse/core/class/handlingdataview.dart';
import 'package:ecommercecourse/core/class/status_request.dart';
import 'package:ecommercecourse/data/model/items_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../../controller/favorite_controller.dart';
import '../../core/constant/imageassets.dart';
import '../widgets/homeScreen/items/custom_list_items.dart';

class GridViewSearchItems<T extends GetxController> extends StatelessWidget {
  const GridViewSearchItems(
      {super.key,
      required this.controller,
      required this.statusRequest,
      required this.dataSearch});
  final T controller;
  final StatusRequest statusRequest;
  final List<ItemsModel> dataSearch;
  @override
  Widget build(BuildContext context) {
    // List<ItemsModel> itemsModel;
    ItemsModel itemsModel;
    FavoriteControllerImp controllerFav = Get.put(FavoriteControllerImp());
    // TODO: implement build
    return GetBuilder<T>(builder: (controller) {
      return HandlingDataView(
        statusRequest: statusRequest,
        widget: dataSearch.isNotEmpty
            ? GridView.builder(
                itemCount: dataSearch.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, childAspectRatio: 0.7),
                itemBuilder: (BuildContext context, index) {
                  itemsModel = dataSearch[index];
                  controllerFav.setFavorite(
                      itemsModel.itemsId, itemsModel.favorite);
                  print("Is Favorite Values : ${controllerFav.isFavorite} ");
                  return CustomListItems(
                    itemsModel: itemsModel,
                  );
                })
            : Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    Text("87".tr),
                    const SizedBox(
                      height: 30,
                    ),
                    Lottie.asset(AppImageAssets.search),
                  ],
                ),
              ),
      );
    });
  }
}
