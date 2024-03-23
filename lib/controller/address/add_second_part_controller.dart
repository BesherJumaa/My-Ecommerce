// ignore_for_file: avoid_print

import 'package:ecommercecourse/controller/address/view_address_controller.dart';
import 'package:ecommercecourse/core/class/status_request.dart';
import 'package:ecommercecourse/core/constant/routes.dart';
import 'package:ecommercecourse/core/services/services.dart';
import 'package:ecommercecourse/data/datasource/remote/address_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';

import '../../core/functions/handling_data_controller.dart';

class AddressAddSecondPartController extends GetxController {
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
  initialData() {
    lat = Get.arguments['lat'];
    long = Get.arguments['long'];
    print("Lat : $lat ,   Long : $long");
    getAdressDetails();
  }

  getAdressDetails() async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(lat!, long!);

      print("==========Name : ");
      print(placemarks[0].name);
      print("==========country : ");
      print(placemarks[0].country);
      print("==========administrativeArea : ");
      print(placemarks[0].administrativeArea);
      print("==========city : ");
      print(placemarks[0].locality);
      print("==========Street : ");
      print(placemarks[0].street);

      name.text = "Home";
      country.text = placemarks[0].country!;
      governorate.text = placemarks[0].administrativeArea!;
      city.text = placemarks[0].locality!;
      street.text = placemarks[0].street!;
    } catch (e) {
      print('Error fetching placemarks: $e');
    }
  }

  addAddress() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await addressData.addAddress(
        myServices.sharedPreferences.getString("id")!,
        name.text,
        city.text,
        governorate.text,
        country.text,
        street.text,
        lat.toString(),
        long.toString());
    statusRequest = handlingData(response);
    print("response is  : $response");
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.offNamed(
          AppRoutes.addressView,
        );
        Get.find<AddressViewController>().getData();
      } else {
        statusRequest = StatusRequest.failure;
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
