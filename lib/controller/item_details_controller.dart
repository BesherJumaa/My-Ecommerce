import 'package:ecommercecourse/controller/cart_controller.dart';
import 'package:ecommercecourse/core/class/status_request.dart';
import 'package:ecommercecourse/core/constant/routes.dart';
import 'package:ecommercecourse/data/model/items_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/constant/color.dart';
import '../core/functions/handlingdatacontroller.dart';
import '../core/services/services.dart';
import '../data/datasource/remote/cart_data.dart';
import '../data/model/cart_model.dart';

abstract class ItemDetailsController extends GetxController {
  initialData();
  removeCart(itemsID);
  addCart(itemsID);
  add();
  remove();
  goToCart();
  getCountItems(itemsID);
}

class ItemDetailsControllerImp extends ItemDetailsController {
  late ItemsModel itemsModel;
  late StatusRequest statusRequest;
  int countItems = 0;
  List<CartModel> data = [];
  MyServices myServices = Get.find();
  CartData cartData = CartData(Get.find());
  // late MyFavoriteModel itemsModels;
  @override
  initialData() async {
    // statusRequest = StatusRequest.loading;
    itemsModel = Get.arguments['itemsModel'];
    countItems = await getCountItems(itemsModel.itemsId!);

    // statusRequest = StatusRequest.success;
    update();
    // itemsModels = Get.arguments['itemsModel'];
  }

  List subItems = [
    {"name": "red", "id": 1, "active": false},
    {"name": "yellow", "id": 2, "active": true},
    {"name": "black", "id": 3, "active": true},
  ];

  @override
  void onInit() {
    initialData();
    super.onInit();
  }

  @override
  getCountItems(itemsID) async {
    // data.clear();
    statusRequest = StatusRequest.loading;
    // update();
    var response = await cartData.getCount(
        itemsID!, myServices.sharedPreferences.getString("id")!);
    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        int countItems = 0;
        countItems = int.parse(response['data']);
        print("Count Items  : $countItems");
        return countItems;
        // data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  remove() {
    // countItems--;
    // removeCart(itemsModel.itemsId);
    // update();
    try {
      countItems > 0 ? {countItems--, removeCart(itemsModel.itemsId)} : null;
      update();
      // TODO: implement remove
    } catch (e) {
      statusRequest = StatusRequest.failure;
      throw UnimplementedError();
    }
  }

  @override
  removeCart(itemsID) async {
    // data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.remove(
        itemsID!, myServices.sharedPreferences.getString("id")!);
    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.rawSnackbar(
            title: "32".tr,
            icon: const Icon(
              Icons.delete,
              color: AppColor.green,
            ),
            messageText: Text(
              "75".tr,
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

  @override
  add() {
    countItems++;
    addCart(itemsModel.itemsId);
    update();
  }

  @override
  addCart(itemsID) async {
    // data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.addCart(
        itemsID!, myServices.sharedPreferences.getString("id")!);
    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        // data.addAll(response['data']);
        Get.rawSnackbar(
            title: "32".tr,
            icon: const Icon(
              Icons.check_box,
              color: AppColor.green,
            ),
            messageText: Text(
              "76".tr,
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
  goToCart() {
    Get.toNamed(AppRoutes.cart);
    throw UnimplementedError();
  }
}
