// ignore_for_file: avoid_print

import 'package:ecommercecourse/core/services/services.dart';

import 'package:ecommercecourse/data/datasource/remote/myfavorite_data.dart';
import 'package:ecommercecourse/data/model/items_model.dart';

import 'package:ecommercecourse/data/model/myfavorite_model.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/class/status_request.dart';
import '../core/constant/color.dart';
import '../core/constant/routes.dart';
import '../core/functions/handlingdatacontroller.dart';

abstract class MyFavoriteController extends GetxController {
  initialData();

  getItems();
  removeFavorite(String? favoriteID);

  goToProductDetails(ItemsModel myFavoriteModel);
}

class MyFavoriteControllerImp extends MyFavoriteController {
  MyFavoriteData myFavoriteData = MyFavoriteData(Get.find());
  List<MyFavoriteModel> data = [];
  late StatusRequest statusRequest;
  MyServices myServices = Get.find();

  @override
  initialData() {
    getItems();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    initialData();
    update();
    super.onInit();
  }

  @override
  getItems() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await myFavoriteData
        .getData(myServices.sharedPreferences.getString("id")!);
    statusRequest = handlingData(response);
    // print("response is  : ${response}");
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List responseData = response['data'];
        data.addAll(responseData.map((e) => MyFavoriteModel.fromJson(e)));
        print("Data : $data");
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  removeFavorite(favoriteID) {
    // data.clear();
    // statusRequest = StatusRequest.loading;
    var response = myFavoriteData.removeFavorite(favoriteID!);
    // statusRequest = handlingData(response);
    // // print("response is  : ${response}");
    // if (StatusRequest.success == statusRequest) {
    //   if (response['status'] == "success") {
    data.removeWhere((element) => element.favoriteId == favoriteID);
    Get.rawSnackbar(
        title: "32".tr,
        icon: const Icon(
          Icons.remove_circle,
          color: AppColor.primaryColor,
        ),
        messageText: Text(
          "53".tr,
          style: const TextStyle(color: AppColor.white),
        ),
        backgroundColor: AppColor.thirdColor,
        isDismissible: true);
    // } else {
    //   statusRequest = StatusRequest.failure;
    // }

    update();
  }

  @override
  goToProductDetails(myFavoriteModel) {
    Get.toNamed(AppRoutes.productDetails,
        arguments: {"itemsModel": myFavoriteModel});
    throw UnimplementedError();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  @override
  // TODO: implement onDelete
  InternalFinalCallback<void> get onDelete => super.onDelete;
}
