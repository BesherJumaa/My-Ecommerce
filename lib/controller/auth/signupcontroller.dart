// ignore_for_file: avoid_print

import 'package:cool_alert/cool_alert.dart';
import 'package:ecommercecourse/core/constant/routes.dart';
import 'package:ecommercecourse/data/datasource/remote/auth/signup_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/class/status_request.dart';
import '../../core/constant/color.dart';
import '../../core/constant/strings.dart';
import '../../core/functions/handling_data_controller.dart';

abstract class SignUpController extends GetxController {
  signUp();
  secures(bool secure);

  toLogin();
  verifyCodeSignUp();
}

class SignUpControllerImp extends SignUpController {
  late TextEditingController email;
  late TextEditingController password;
  late TextEditingController repassword;
  late TextEditingController username;
  late TextEditingController phone;
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  late RxBool? secure = true.obs;
  StatusRequest statusRequest = StatusRequest.none;

  SignupData signupData = SignupData(Get.find());

  List data = [];

  @override
  signUp() async {
    // TODO: implement login
    var formdata = formState.currentState;
    if (formdata!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await signupData.postData(
          username.text, email.text, password.text, phone.text);
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          print(response['status']);
          Get.rawSnackbar(
              title: "32".tr,
              icon: const Icon(
                Icons.check_box,
                color: AppColor.green,
              ),
              messageText: Text("58".tr),
              backgroundColor: AppColor.primaryColor,
              isDismissible: true);
          Get.offAndToNamed(AppRoutes.verifyCodeSignUp,
              arguments: {"email": email.text});
        } else {
          print("Email: ");
          print(email.text);
          CoolAlert.show(
              backgroundColor: AppColor.primaryColor,
              context: Get.overlayContext!,
              type: CoolAlertType.info,
              confirmBtnColor: AppColor.primaryColor,
              text: Strings.existed,
              onConfirmBtnTap: () {
                statusRequest = StatusRequest.failure;
              });
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    } else {
      print("Not Valid");
    }
    update();
  }

  @override
  toLogin() {
    Get.offAndToNamed(AppRoutes.login);
    // TODO: implement toSignUp
    throw UnimplementedError();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    email = TextEditingController();
    password = TextEditingController();
    repassword = TextEditingController();
    phone = TextEditingController();
    username = TextEditingController();

    super.onInit();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    email.dispose();
    password.dispose();
    repassword.dispose();
    username.dispose();
    phone.dispose();
    super.dispose();
  }

  @override
  secures(bool? secure) {
    secure = !secure!;
    // TODO: implement secures
    throw UnimplementedError();
  }

  @override
  verifyCodeSignUp() {
    // TODO: implement checkEmail
    throw UnimplementedError();
  }
}
