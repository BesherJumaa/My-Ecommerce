import 'package:ecommercecourse/controller/search_controller.dart';
import 'package:ecommercecourse/core/class/status_request.dart';
import 'package:ecommercecourse/core/functions/handling_data_controller.dart';
import 'package:ecommercecourse/data/datasource/remote/offers_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../data/model/items_model.dart';

class OffersController extends SearchMixController {
  OffersData offersData = OffersData(Get.find());

  List<ItemsModel> data = [];

  getData() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await offersData.getData();
    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        List dataList = response['data'];
        data.addAll(dataList.map((e) => ItemsModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    super.onInit();
    search = TextEditingController();
    getData();
  }
}
