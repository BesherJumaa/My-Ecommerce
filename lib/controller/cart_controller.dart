// ignore_for_file: avoid_print

import 'package:ecommercecourse/core/services/services.dart';
import 'package:ecommercecourse/data/model/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../core/class/status_request.dart';
import '../core/constant/color.dart';
import '../core/functions/handlingdatacontroller.dart';
import '../data/datasource/remote/cart_data.dart';

abstract class CartController extends GetxController {
  initialData();
  resetVarCart();
  refreshPage();
  getItems();
  remove(String? itemsID);
  add(String? itemsID);
  getCountItems(itemsID);
}

class CartControllerImp extends CartController {
  CartData cartData = CartData(Get.find());
  List<CartModel> data = [];
  late StatusRequest statusRequest;
  MyServices myServices = Get.find();
  double totalPrice = 0.0;
  int totalcountItems = 0;

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
    // data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response =
        await cartData.getData(myServices.sharedPreferences.getString("id")!);
    statusRequest = handlingData(response);
    print("response is  : ${response}");
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        // if (response['datacart']['status'] == "success") {
        List responseData = response['datacart'];
        print("Response Data : $responseData");
        Map responseDataCountPrice = response['countprice'];
        data.clear();
        data.addAll(responseData.map((e) => CartModel.fromJson(e)));
        totalcountItems = int.parse(responseDataCountPrice['totalcount']);
        totalPrice = double.parse(responseDataCountPrice['totalprice']);
        // }
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  remove(itemsID) async {
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
              Icons.remove_circle,
              color: AppColor.red,
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
  add(itemsID) async {
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
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  @override
  // TODO: implement onDelete
  InternalFinalCallback<void> get onDelete => super.onDelete;

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
  resetVarCart() {
    totalPrice = 0.0;
    totalcountItems = 0;
    data.clear();
  }

  @override
  refreshPage() {
    resetVarCart();
    getItems();
  }
}