import 'package:cool_alert/cool_alert.dart';
import 'package:ecommercecourse/core/class/status_request.dart';
import 'package:ecommercecourse/core/constant/color.dart';
import 'package:ecommercecourse/core/constant/routes.dart';
import 'package:ecommercecourse/data/datasource/remote/auth/verifycodesignup_data.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../core/functions/handling_data_controller.dart';

abstract class VerifyCodeSignUpController extends GetxController {
  checkCode();
  goToSuccessSignUp(String verifyCode);
  resend();
}

class VerifyCodeSignUpControllerImp extends VerifyCodeSignUpController {
  VerifyCodeSignupData verfiyCodeSignUpData = VerifyCodeSignupData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  String? email;
  @override
  checkCode() {
    // TODO: implement login
    // Get.offAndToNamed(AppRoutes.language);
    throw UnimplementedError();
  }

  @override
  goToSuccessSignUp(String verifyCode) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await verfiyCodeSignUpData.postdata(verifyCode, email!);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.offNamed(AppRoutes.successSignUp);
      } else {
        CoolAlert.show(
            context: Get.overlayContext!,
            type: CoolAlertType.error,
            text: "Verify Code Is Not Correct",
            confirmBtnText: "Try Again",
            confirmBtnColor: AppColor.primaryColor,
            onConfirmBtnTap: () {
              statusRequest = StatusRequest.failure;
              update();
            });

        return statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    email = Get.arguments['email'];
    super.onInit();
  }

  @override
  resend() {
    verfiyCodeSignUpData.resendData(email!);
    Get.rawSnackbar(
        title: "32".tr,
        icon: const Icon(
          Icons.refresh,
          // color: AppColor.primaryColor,
        ),
        messageText: Text(
          "52".tr,
          style: const TextStyle(color: AppColor.white),
        ),
        backgroundColor: AppColor.thirdColor,
        isDismissible: true);
  }
}
