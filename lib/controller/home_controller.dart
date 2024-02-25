// ignore_for_file: avoid_print
import 'package:ecommercecourse/core/constant/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../core/class/status_request.dart';
import '../core/functions/handling_data_controller.dart';
import 'search_controller.dart';

abstract class HomeController extends SearchMixController {
  initialData();
  getData();
  goToItems(List items, selectedItem);
  goToCategory(List categories, selectedcat, categoryId);
}

class HomeControllerImp extends HomeController {
  // List data = [];
  List categories = [];
  List items = [];

  String? username;
  String? id, phone;
  String? lang;
  @override
  initialData() {
    search = TextEditingController();
    lang = myServices.sharedPreferences.getString("lang");
    username = myServices.sharedPreferences.getString("username");
    id = myServices.sharedPreferences.getString("id");
    phone = myServices.sharedPreferences.getString("phone");
  }

  @override
  void onInit() {
    getData();
    initialData();
    update();
    super.onInit();
  }

  @override
  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await homeData.getData();
    statusRequest = handlingData(response);
    items.clear();
    // print("response is  : ${response}");
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        categories.addAll(response['categories']);
        // print("Categories are : ${response['categories']}");
        items.addAll(response['items']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  goToItems(items, selectedItem) {
    Get.toNamed(AppRoutes.items,
        arguments: {"items": items, "selecteditem": selectedItem});
  }

  @override
  goToCategory(categories, selectedcat, categoryId) {
    Get.toNamed(AppRoutes.items, arguments: {
      "categories": categories,
      "selectedcat": selectedcat,
      "categoryId": categoryId
    });
  }
}
