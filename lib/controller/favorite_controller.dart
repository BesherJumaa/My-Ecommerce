import 'package:ecommercecourse/core/constant/color.dart';
import 'package:ecommercecourse/data/datasource/remote/favorite_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../core/class/status_request.dart';
import '../core/functions/handlingdatacontroller.dart';
import '../core/services/services.dart';

abstract class FavoriteController extends GetxController {
  setFavorite(id, val);
  addFavorite(String itemsID);
  removeFavorite(String itemsID);
}

class FavoriteControllerImp extends FavoriteController {
  Map isFavorite = {};
  List data = [];
  late StatusRequest statusRequest;
  MyServices myServices = Get.find();
  FavoriteData favoriteData = FavoriteData(Get.find());
  @override
  setFavorite(id, val) {
    isFavorite[id] = val;
    update();
  }

  @override
  addFavorite(itemsID) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await favoriteData.addFavorite(
        itemsID, myServices.sharedPreferences.getString("id")!);
    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        setFavorite(itemsID, "1");
        // data.addAll(response['data']);
        Get.rawSnackbar(
            title: "32".tr,
            icon: const Icon(
              Icons.check_box,
              color: AppColor.green,
            ),
            messageText: Text(
              "54".tr,
              style: const TextStyle(color: AppColor.white),
            ),
            backgroundColor: AppColor.thirdColor,
            isDismissible: true);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  removeFavorite(itemsID) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await favoriteData.removeFavorite(
        itemsID, myServices.sharedPreferences.getString("id")!);
    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        setFavorite(itemsID, "0");
        Get.rawSnackbar(
            title: "32".tr,
            icon: const Icon(
              Icons.remove_circle,
              color: AppColor.red,
            ),
            messageText: Text(
              "53".tr,
              style: const TextStyle(color: AppColor.white),
            ),
            backgroundColor: AppColor.thirdColor,
            isDismissible: true);

        // data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
}
