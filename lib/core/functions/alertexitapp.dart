import 'dart:io';
import 'package:ecommercecourse/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<bool> alertExitApp() {
  Get.defaultDialog(title: "60".tr, middleText: "65".tr, actions: [
    MaterialButton(
      onPressed: () {
        exit(0);
      },
      color: AppColor.primaryColor,
      child: Text(
        "62".tr,
        style: const TextStyle(color: AppColor.white),
      ),
    ),
    MaterialButton(
      onPressed: () {
        Get.back();
      },
      color: AppColor.primaryColor,
      child: Text(
        "61".tr,
        style: const TextStyle(color: AppColor.white),
      ),
    ),
  ]);
  return Future.value(true);
}
