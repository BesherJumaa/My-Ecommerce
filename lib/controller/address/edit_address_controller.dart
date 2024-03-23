// ignore_for_file: avoid_print

import 'package:ecommercecourse/controller/address/view_address_controller.dart';
import 'package:ecommercecourse/core/class/status_request.dart';
import 'package:ecommercecourse/core/constant/routes.dart';
import 'package:ecommercecourse/core/services/services.dart';
import 'package:ecommercecourse/data/datasource/remote/address_data.dart';
import 'package:ecommercecourse/data/model/address_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/functions/handling_data_controller.dart';

class AddressEditController extends GetxController {
  MyServices myServices = Get.find();
  AddressData addressData = AddressData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  TextEditingController name = TextEditingController();
  TextEditingController country = TextEditingController();
  TextEditingController governorate = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController street = TextEditingController();
  double? lat;
  double? long;
  late String addressId;
  late AddressModel addressModel;
  initialData() {
    addressId = Get.arguments['addressId'];

    print("Address ID : $addressId");
    getAddressDetails();
  }

  getAddressDetails() async {
    statusRequest = StatusRequest.loading;

    var response = await addressData.getDataByAddressID(
      addressId,
    );

    if (response['status'] == 'success') {
      addressModel = AddressModel.fromJson(response['data'][0]);

      name.text = addressModel.addressName!;
      country.text = addressModel.addressCountry!;
      governorate.text = addressModel.addressGovernorate!;
      city.text = addressModel.addressCity!;
      street.text = addressModel.addressStreet!;

      statusRequest = StatusRequest.success;
    } else {
      statusRequest = StatusRequest.failure;
    }
    update();
  }

  updateAddress() async {
    statusRequest = StatusRequest.loading;
    var response = await addressData.editAddress(
      addressId,
      name.text,
      city.text,
      governorate.text,
      country.text,
      street.text,
    );
    statusRequest = handlingData(response);
    print("response is  : $response");
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.offNamed(AppRoutes.addressView);
        Get.find<AddressViewController>().getData();
      } else {
        statusRequest = StatusRequest.failure;
        Get.offNamed(AppRoutes.addressView);
        Get.find<AddressViewController>().getData();
      }
    }
    update();
  }

  @override
  void onInit() {
    initialData();

    super.onInit();
  }
}
