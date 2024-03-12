import 'package:ecommercecourse/controller/orders/order_pending_controller.dart';
import 'package:ecommercecourse/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rating_dialog/rating_dialog.dart';

// show the dialog
void showRatingDialog(BuildContext context, String orderID) {
  showDialog(
    context: context,
    barrierDismissible: true, // set to false if you want to force a rating
    builder: (context) => RatingDialog(
        initialRating: 1.0,
        // your app's name?
        title: Text(
          '135'.tr,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        // encourage your user to leave a high rating?
        message: Text(
          '134'.tr,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
        // your app's logo?
        starColor: AppColor.secondColor,
        submitButtonTextStyle: const TextStyle(
            fontWeight: FontWeight.bold, color: AppColor.primaryColor),
        submitButtonText: '61'.tr,
        onSubmitted: (response) {
          OrdersPendingController controller = Get.find();
          controller.submitRating(orderID, response.rating, response.comment);
        }),
  );
}
