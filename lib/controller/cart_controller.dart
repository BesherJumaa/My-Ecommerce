// ignore_for_file: avoid_print

import 'package:ecommercecourse/data/model/cart_model.dart';
import 'package:ecommercecourse/controller/search_controller.dart';
import 'package:ecommercecourse/data/model/coupon_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../core/class/status_request.dart';
import '../core/constant/color.dart';
import '../core/functions/handling_data_controller.dart';
import '../data/datasource/remote/cart_data.dart';
import '../view/cart/checkout.dart';

abstract class CartController extends SearchMixController {
  initialData();
  resetVarCart();
  refreshPage();
  getItems();
  remove(String? itemsID);
  add(String? itemsID);
  getCountItems(itemsID);
  checkCoupon();
  goToCheckOut();
}

class CartControllerImp extends CartController {
  CartData cartData = CartData(Get.find());
  // CartModel? cartModel;
  List<CartModel> data = [];
  CouponModel couponModel = CouponModel();
  late TextEditingController coupon;
  double totalPrice = 0.0;
  double shipping = 0.0;
  int totalcountItems = 0;
  int discountCoupon = 0;
  String? couponName;
  String couponID = "0";

  @override
  initialData() {
    coupon = TextEditingController();
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
    print("response is  : $response");
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        // if (response['datacart']['status'] == "success") {

        if (response['datacart']['status'] == "success") {
          List responseData = response['datacart']['data'];
          print("Response Data : $responseData");
          Map responseDataCountPrice = response['countprice'];
          // cartModel = response['countprice'];
          data.clear();
          data.addAll(responseData.map((e) => CartModel.fromJson(e)));
          totalcountItems = int.parse(responseDataCountPrice['totalcount']);
          totalPrice = double.parse(responseDataCountPrice['totalprice']);
          shipping = double.parse(responseDataCountPrice['totalprice']);
        }

        // discount = int.parse(responseDataCountPrice['items_discount']);
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
  checkCoupon() async {
    // data.clear();
    discountCoupon = 0;
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.checkCoupon(coupon.text);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Map<String, dynamic> dataCoupons = response['data'];
        couponModel = CouponModel.fromJson(dataCoupons);
        discountCoupon = int.parse(couponModel.couponDiscount!);
        couponName = couponModel.couponName!;
        couponID = couponModel.couponId!;
        Get.rawSnackbar(
            title: "32".tr,
            icon: const Icon(
              Icons.check_box,
              color: AppColor.green,
            ),
            messageText: Text(
              "101".tr,
              style: const TextStyle(color: AppColor.white),
            ),
            backgroundColor: AppColor.thirdColor,
            isDismissible: true);
        // data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.none;
        discountCoupon = 0;
        couponName = null;
        couponID = "0";
        Get.rawSnackbar(
            title: "60".tr,
            icon: const Icon(
              Icons.error_outline,
              color: AppColor.red,
            ),
            messageText: Text(
              "102".tr,
              style: const TextStyle(color: AppColor.white),
            ),
            backgroundColor: AppColor.thirdColor,
            isDismissible: true);
      }
    }
    update();
  }

  getTotalPrice() {
    return (totalPrice - totalPrice * discountCoupon / 100);
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

  @override
  goToCheckOut() {
    if (data.isEmpty) {
      Get.snackbar(
        "60".tr,
        "84".tr,
        backgroundColor: AppColor.primaryColor,
        colorText: AppColor.white,
      );
    } else {
      Get.to(const Checkout(),
          transition: Transition.circularReveal,
          duration: const Duration(seconds: 1),
          arguments: {
            "couponid": couponID,
            "totalprice": totalPrice.toString(),
            "discountCoupon": discountCoupon.toString(),
          });
    }
  }
}
