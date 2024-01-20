import 'package:ecommercecourse/core/class/StatusRequest.dart';
import 'package:ecommercecourse/data/datasource/remote/test_data.dart';
import 'package:get/get.dart';

import '../core/functions/handlingdatacontroller.dart';

class TestController extends GetxController {
  TestData testData = TestData(Get.find());

  List data = [];
  late StatusRequest statusRequest;

  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await testData.getData();
    statusRequest = handlingData(response);
    // print("response is  : ${response}");
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        data.addAll(response['data']);
      } else {
        return statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}