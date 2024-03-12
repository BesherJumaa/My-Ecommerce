import 'package:ecommercecourse/core/class/status_request.dart';
import 'package:ecommercecourse/core/constant/routes.dart';
import 'package:ecommercecourse/core/services/services.dart';
import 'package:ecommercecourse/data/datasource/remote/address_data.dart';
import 'package:ecommercecourse/data/model/address_model.dart';
import 'package:ecommercecourse/linkapi.dart';
import 'package:ecommercecourse/view/screens/address/address_edit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/constant/color.dart';
import '../../core/functions/handling_data_controller.dart';

class AddressViewController extends GetxController {
  AddressData addressData = AddressData(Get.find());
  MyServices myServices = Get.find();

  List<AddressModel> data = [];
  late StatusRequest statusRequest;

  getData() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await addressData
        .getData(myServices.sharedPreferences.getString("id")!);
    statusRequest = handlingData(response);
    print("response is  : ${response}");
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List listData = response['data'];
        data.addAll(listData.map((e) => AddressModel.fromJson(e)));
        if (data.isEmpty) {
          statusRequest = StatusRequest.failure;
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  deleteAddress(addressID) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await addressData.deleteAddress(addressID);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        // Find the index of the address to delete
        int indexToRemove =
            data.indexWhere((address) => address.addressId == addressID);
        if (indexToRemove != -1) {
          // Remove the address from the list
          data.removeAt(indexToRemove);
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
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  goToEdit(addressId) {
    Get.to(const AddressEdit(),
        arguments: {
          "addressId": addressId,
        },
        transition: Transition.size,
        duration: const Duration(seconds: 1));
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
