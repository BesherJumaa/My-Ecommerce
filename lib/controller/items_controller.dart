// ignore_for_file: avoid_print

import 'package:ecommercecourse/data/datasource/remote/items_data.dart';
import 'package:ecommercecourse/controller/search_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../core/class/status_request.dart';
import '../core/constant/routes.dart';
import '../core/functions/handling_data_controller.dart';

abstract class ItemsController extends SearchMixController {
  initialData();
  changeCat(int val, String categoriesId);
  changeFavorite(bool val);
  getItems(String categoryId);
  PageController get pageController;
}

class ItemsControllerImp extends ItemsController {
  List categories = [];
  int? selectedCat;
  String? catID;
  String? userId;
  bool favorite = false;
  List data = [];

  ItemsData itemsData = ItemsData(Get.find());
  @override
  initialData() {
    search = TextEditingController();
    categories = Get.arguments['categories'];
    selectedCat = Get.arguments['selectedcat'];
    catID = Get.arguments['categoryId'];
    userId = Get.arguments['usersId'];
    getItems(catID!);
    pageController = PageController(initialPage: selectedCat ?? 0);
  }

  @override
  late PageController pageController;
  @override
  void onInit() {
    // TODO: implement onInit

    initialData();
    super.onInit();
  }

  @override
  changeCat(val, categoriesId) {
    selectedCat = val;
    catID = categoriesId;
    getItems(catID!);
    update();
  }

  @override
  changeFavorite(bool val) {
    val = !val;
    favorite = val;
    print(favorite);
    update();
  }

  @override
  getItems(categoryId) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await itemsData.getData(
        categoryId, myServices.sharedPreferences.getString("id")!);
    statusRequest = handlingData(response);
    // print("response is  : ${response}");
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  goToProductDetails(itemsModel) {
    Get.toNamed(AppRoutes.productDetails,
        arguments: {"itemsModel": itemsModel});
    throw UnimplementedError();
  }
}
