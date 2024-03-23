import 'dart:async';

import 'package:ecommercecourse/core/class/status_request.dart';
import 'package:ecommercecourse/core/services/services.dart';
import 'package:ecommercecourse/data/datasource/remote/orders_data.dart';
import 'package:ecommercecourse/data/model/cart_model.dart';
import 'package:ecommercecourse/data/model/orders_model.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../core/functions/handling_data_controller.dart';

class OrdersDetailsController extends GetxController {
  OrdersData ordersData = OrdersData(Get.find());
  MyServices myServices = Get.find();
  List<CartModel> data = [];
  late StatusRequest statusRequest;
  late OrdersModel ordersModel;

  Completer<GoogleMapController>? completercontroller;

  List<Marker> markers = [];

  double? lat;
  double? long;

  CameraPosition? cameraPosition;

  intialData() {
    if (ordersModel.ordersType == "0") {
      cameraPosition = CameraPosition(
        target: LatLng(double.parse(ordersModel.addressLat!),
            double.parse(ordersModel.addressLong!)),
        zoom: 12.4746,
      );
      markers.add(Marker(
          markerId: const MarkerId("1"),
          position: LatLng(double.parse(ordersModel.addressLat!),
              double.parse(ordersModel.addressLong!))));
    }
  }

  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await ordersData.getDetailsData(ordersModel.ordersId!);
    statusRequest = handlingData(response);
    // print("response is  : ${response}");
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        // data.addAll(response['data']);
        List listData = response['data'];
        print("=============LAT :${ordersModel.addressLat} ============");
        print("=============Long :${ordersModel.addressLong} ============");
        data.addAll(listData.map((e) => CartModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    ordersModel = Get.arguments['ordersmodel'];
    intialData();
    getData();
    super.onInit();
  }
}
