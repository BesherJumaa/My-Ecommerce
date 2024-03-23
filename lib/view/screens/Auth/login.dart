// ignore_for_file: avoid_print, deprecated_member_use

import 'package:ecommercecourse/controller/auth/login_controller.dart';
import 'package:ecommercecourse/core/class/handlingdataview.dart';
import 'package:ecommercecourse/core/class/status_request.dart';
import 'package:ecommercecourse/core/functions/alert_exit_app.dart';
import 'package:ecommercecourse/core/functions/valid_input.dart';
import 'package:ecommercecourse/view/widgets/Auth/custom_text_body_auth.dart';
import 'package:ecommercecourse/view/widgets/Auth/custom_text_form.dart';
import 'package:ecommercecourse/view/widgets/Auth/custom_title_auth.dart';
import 'package:ecommercecourse/view/widgets/Auth/logo_auth.dart';
import 'package:ecommercecourse/view/widgets/auth/custom_appbar_auth.dart';
import 'package:ecommercecourse/view/widgets/auth/custom_forgot_password.dart';
import 'package:ecommercecourse/view/widgets/auth/no_account_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constant/color.dart';
import '../../widgets/auth/custom_button_auth.dart';
import '../../widgets/auth/custom_password_textform.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => LoginControllerImp());
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColor.backGroundColor,
      appBar: CustomAppBarAuth(
        title: "26".tr,
      ),
      body: GetBuilder<LoginControllerImp>(
        builder: (controller) => HandlingDataRequest(
          statusRequest: controller.statusRequest,
          onOffline: () {
            controller.statusRequest = StatusRequest.none;
            controller.onInit();
          },
          widget: WillPopScope(
            onWillPop: alertExitApp,
            child: Form(
              key: controller.formstate,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 35, vertical: 15),
                child: Column(
                  children: [
                    CustomTitleAuth(title: "10".tr),
                    const LogoAuth(),
                    CustomTextBodyAuth(body: "11".tr),
                    const SizedBox(
                      height: 20,
                    ),
                    //Enter Your Email
                    AuthTextFormField(
                      keyboardtype: TextInputType.emailAddress,
                      mycontroller: controller.email,
                      textBox: "18".tr,
                      hintText: "12".tr,
                      iconPrefix: Icons.email_outlined,
                      validator: (String? val) {
                        print(val);
                        return validInput(val!, 5, 50, "email");
                      },
                    ),
                    //Enter Password
                    AuthPasswordTextFormField(
                      validator: (val) {
                        print(val);
                        return validInput(val!, 5, 50, "password");
                      },
                      // secure: controller.secure.value,
                      // onIconPressed: controller.secures(controller.secure.value),
                      mycontroller: controller.password,
                      textBox: "13".tr,
                      hintText: "19".tr,
                    ),

                    const SizedBox(
                      height: 10,
                    ),
                    CustomForgotPassword(onTap: () {
                      controller.toForgotPassword();
                    }),
                    CustomBottomAuth(
                      text: '15'.tr,
                      onPressed: () {
                        controller.login();
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    NoAccountAuth(
                        text: "16".tr,
                        buttonText: "17".tr,
                        onTap: () {
                          controller.toSignUp();
                        }),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
