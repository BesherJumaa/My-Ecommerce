// ignore_for_file: avoid_print

import 'package:cool_alert/cool_alert.dart';
import 'package:ecommercecourse/core/class/status_request.dart';
import 'package:ecommercecourse/core/constant/routes.dart';
import 'package:ecommercecourse/core/functions/handling_data_controller.dart';
import 'package:ecommercecourse/core/services/services.dart';
import 'package:ecommercecourse/data/datasource/remote/address_data.dart';
import 'package:ecommercecourse/data/datasource/remote/checkout_data.dart';
import 'package:ecommercecourse/data/model/address_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/constant/color.dart';
import '../view/screens/address/address_add.dart';

abstract class CheckoutController extends GetxController {
  choosePaymentMethod(String val);
  chooseDeliveryType(String val);
  chooseShippingAddress(String val);
  getShippingAddress();
  checkout();
  addAddress();
}

class CheckoutControllerImp extends CheckoutController {
  String? paymentMethod;
  String? deliveryType;
  String? addressID = "0";
  late String couponID;
  late String totalprice;
  late String discountCoupon;
  StatusRequest statusRequest = StatusRequest.none;
  List<AddressModel> dataAddress = [];
  MyServices myServices = Get.find();
  AddressData addressData = AddressData(Get.find());
  CheckOutData checkOutData = CheckOutData(Get.find());

  @override
  choosePaymentMethod(String val) {
    paymentMethod = val;
    update();
  }

  @override
  chooseDeliveryType(String val) {
    deliveryType = val;
    update();
  }

  @override
  chooseShippingAddress(String val) {
    addressID = val;
    update();
  }

  @override
  getShippingAddress() async {
    statusRequest = StatusRequest.loading;
    dataAddress.clear();
    var response = await addressData
        .getData(myServices.sharedPreferences.getString("id")!);
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        List listData = response['data'];

        dataAddress.addAll(listData.map((e) => AddressModel.fromJson(e)));
        addressID = dataAddress[0].addressId;
      } else {
        statusRequest = StatusRequest.none;
      }
    }
    update();
  }

  @override
  checkout() async {
    if (paymentMethod == null) {
      return CoolAlert.show(
        context: Get.context!,
        confirmBtnText: "61".tr,
        showCancelBtn: false,
        backgroundColor: AppColor.primaryColor,
        animType: CoolAlertAnimType.slideInDown,
        borderRadius: BorderSide.strokeAlignCenter,
        type: CoolAlertType.error,
        autoCloseDuration: const Duration(seconds: 2),
        loopAnimation: true,
        confirmBtnColor: AppColor.primaryColor,
        title: "600".tr,
        titleTextStyle: const TextStyle(
            color: AppColor.red, fontSize: 20, fontWeight: FontWeight.bold),
        text: "112".tr,
      );
    }
    if (deliveryType == null) {
      return CoolAlert.show(
        context: Get.context!,
        confirmBtnText: "61".tr,
        showCancelBtn: false,
        backgroundColor: AppColor.primaryColor,
        animType: CoolAlertAnimType.slideInUp,
        borderRadius: BorderSide.strokeAlignOutside,
        autoCloseDuration: const Duration(seconds: 2),
        type: CoolAlertType.error,
        loopAnimation: true,
        confirmBtnColor: AppColor.primaryColor,
        title: "600".tr,
        titleTextStyle: const TextStyle(
            color: AppColor.red, fontSize: 20, fontWeight: FontWeight.bold),
        text: "113".tr,
      );
    }
    if (dataAddress.isEmpty && deliveryType != null) {
      CoolAlert.show(
        context: Get.overlayContext!,
        confirmBtnText: "88".tr,
        showCancelBtn: false,
        backgroundColor: AppColor.primaryColor,
        animType: CoolAlertAnimType.slideInDown,
        borderRadius: BorderSide.strokeAlignCenter,
        type: CoolAlertType.error,
        // autoCloseDuration: const Duration(seconds: 2),
        loopAnimation: true,
        confirmBtnColor: AppColor.primaryColor,
        cancelBtnText: "62".tr,
        title: "600".tr,
        titleTextStyle: const TextStyle(
          color: AppColor.red,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        text: "141".tr,
        onConfirmBtnTap: () {},
      );
    }

    statusRequest = StatusRequest.loading;
    update();
    Map data = {
      "usersid": myServices.sharedPreferences.getString("id")!,
      "addressid": addressID.toString(),
      "orderstype": deliveryType.toString(),
      "pricedelivery": "10",
      "ordersprice": totalprice,
      "couponid": couponID,
      "paymentmethod": paymentMethod.toString(),
      "coupondiscount": discountCoupon.toString(),
    };
    var response = await checkOutData.checkout(data);
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == "success") {
        // List listData = response['data'];
        // dataAddress.addAll(listData.map((e) => AddressModel.fromJson(e)));
        print("Success");
        Get.snackbar(
          "32".tr,
          "111".tr,
          backgroundColor: AppColor.primaryColor,
          colorText: AppColor.white,
        );
        // Get.offAll(
        //   const HomePage(),
        //   routeName: AppRoutes.homePage,
        //   transition: Transition.fade,
        //   duration: const Duration(seconds: 1),
        // );
        Get.offAllNamed(AppRoutes.homePage);
      } else {
        statusRequest = StatusRequest.none;
        Get.snackbar(
          "600".tr,
          "601".tr,
          backgroundColor: AppColor.primaryColor,
          colorText: AppColor.white,
        );
      }
    }
    update();
  }

  @override
  void onInit() {
    couponID = Get.arguments['couponid'];
    totalprice = Get.arguments['totalprice'];
    discountCoupon = Get.arguments['discountCoupon'];

    getShippingAddress();
    super.onInit();
  }

  @override
  addAddress() {
    Get.to(() => const AddressAdd(),
        transition: Transition.downToUp, duration: const Duration(seconds: 1));
  }
}
