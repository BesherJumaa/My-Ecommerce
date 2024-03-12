import 'package:ecommercecourse/view/screens/homeScreens/item_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../core/class/status_request.dart';
import '../core/constant/routes.dart';
import '../core/functions/handling_data_controller.dart';
import '../core/services/services.dart';
import '../data/datasource/remote/home_data.dart';
import '../data/model/items_model.dart';

class SearchMixController extends GetxController {
  bool isSearch = false;
  late TextEditingController search;
  List<ItemsModel> dataSearch = [];
  late StatusRequest statusRequest;
  MyServices myServices = Get.find();
  HomeData homeData = HomeData(Get.find());

  checkSearch(val) {
    val == ""
        ? {isSearch = false, statusRequest = StatusRequest.none}
        : isSearch = true;
    update();
  }

  onSearchItem() {
    isSearch = true;
    searchData();
    update();
  }

  searchData() async {
    statusRequest = StatusRequest.loading;
    var response = await homeData.searchData(search!.text);
    statusRequest = handlingData(response);
    // print("response is  : ${response}");
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        dataSearch.clear();
        List responseData = response['data'];
        dataSearch.addAll(responseData.map((e) => ItemsModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  goToProductDetails(itemsModel) {
    Get.to(const ItemDetails(),
        arguments: {"itemsModel": itemsModel},
        transition: Transition.size,
        duration: const Duration(seconds: 1));
  }
}
