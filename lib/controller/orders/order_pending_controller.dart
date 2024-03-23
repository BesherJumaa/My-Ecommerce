// ignore_for_file: avoid_print

import 'package:cool_alert/cool_alert.dart';
import 'package:ecommercecourse/core/constant/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/class/status_request.dart';
import '../../core/constant/color.dart';
import '../../core/functions/handling_data_controller.dart';
import '../../core/services/services.dart';
import '../../data/datasource/remote/orders_data.dart';
import '../../data/model/orders_model.dart';

class OrdersPendingController extends GetxController {
  final ScrollController scrollController = ScrollController();
  var show = false;
  OrdersData ordersData = OrdersData(Get.find());
  MyServices myServices = Get.find();
  List<OrdersModel> data = [];
  List<OrdersModel> dataArchive = [];
  late StatusRequest statusRequest;
  bool archived = false;

  getData() async {
    statusRequest = StatusRequest.loading;
    data.clear();
    var response = await ordersData
        .getPendingData(myServices.sharedPreferences.getString("id")!);
    statusRequest = handlingData(response);
    // print("response is  : ${response}");
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        // data.addAll(response['data']);
        List listData = response['data'];
        data.addAll(listData.map((e) => OrdersModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  getArchivedData() async {
    statusRequest = StatusRequest.loading;
    dataArchive.clear();
    var response = await ordersData
        .getArchiveData(myServices.sharedPreferences.getString("id")!);
    statusRequest = handlingData(response);
    // print("response is  : ${response}");
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        // data.addAll(response['data']);
        List listDataArchive = response['data'];
        dataArchive.addAll(listDataArchive.map((e) => OrdersModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  void submitRating(String orderID, double rating, String comment) async {
    statusRequest = StatusRequest.loading;

    var response = await ordersData.rating(orderID, rating.toString(), comment);
    statusRequest = handlingData(response);
    // print("response is  : ${response}");
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        getArchivedData();
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  String printOrderStatus(String val) {
    if (val == "0") {
      return "116".tr;
    } else if (val == "1") {
      return "117".tr;
    } else if (val == "2") {
      return "118".tr;
    } else if (val == "3") {
      return "119".tr;
    } else {
      return "115".tr;
    }
  }

  printOrderType(String val) {
    if (val == "0") {
      return val = "110".tr;
    } else if (val == "1") {
      return val = "109".tr;
    }
  }

  printPaymentMethod(String val) {
    if (val == "0") {
      return val = "105".tr;
    } else if (val == "1") {
      return val = "106".tr;
    }
  }

  void showWidget(value) {
    show = !value;

    update();
  }

  goToArchivedOrders() {
    show = false;
    Get.toNamed(
      AppRoutes.ordersArchive,
    );
    getArchivedData();
  }

  goToPendingOrders() {
    Get.back();
    onInit();
  }

  @override
  void onInit() {
    getData();

    super.onInit();
  }

  confirmDeleteOrder(String orderid) {
    CoolAlert.show(
        context: Get.context!,
        type: CoolAlertType.warning,
        title: "60".tr,
        showCancelBtn: true,
        backgroundColor: AppColor.primaryColor,
        confirmBtnColor: AppColor.primaryColor,
        animType: CoolAlertAnimType.scale,
        confirmBtnText: "61".tr,
        cancelBtnText: "62".tr,
        text: "132".tr,
        onConfirmBtnTap: () {
          deleteOrder(orderid);
        });
  }

  deleteOrder(String orderid) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await ordersData.deleteOrder(orderid);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // Start backend
      if (response['status'] == "success") {
        refrehOrder();
      } else {
        statusRequest = StatusRequest.failure;
      }
      // End
    }
    update();
  }

  refrehOrder() {
    getData();
  }
}
