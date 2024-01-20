import 'dart:io';
import 'package:ecommercecourse/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<bool> alertExitApp() {
  Get.defaultDialog(
      title: "Warning",
      middleText: "Are You Sure You Want To Exit App?",
      actions: [
        MaterialButton(
          onPressed: () {
            exit(0);
          },
          color: AppColor.primaryColor,
          child: const Text("Confirm"),
        ),
        MaterialButton(
          onPressed: () {
            Get.back();
          },
          color: AppColor.primaryColor,
          child: const Text("Cancel"),
        ),
      ]);
  return Future.value(true);
}
