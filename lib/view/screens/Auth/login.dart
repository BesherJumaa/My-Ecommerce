// ignore_for_file: avoid_print

import 'package:ecommercecourse/controller/auth/logincontroller.dart';
import 'package:ecommercecourse/core/class/handlingdataview.dart';
import 'package:ecommercecourse/core/functions/alertexitapp.dart';
import 'package:ecommercecourse/core/functions/validinput.dart';
import 'package:ecommercecourse/view/widgets/Auth/customtextbodyauth.dart';
import 'package:ecommercecourse/view/widgets/Auth/customtextform.dart';
import 'package:ecommercecourse/view/widgets/Auth/customtitleauth.dart';
import 'package:ecommercecourse/view/widgets/Auth/logoauth.dart';
import 'package:ecommercecourse/view/widgets/auth/customappbarauth.dart';
import 'package:ecommercecourse/view/widgets/auth/customforgotpassword.dart';
import 'package:ecommercecourse/view/widgets/auth/noaccountauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';
import '../../widgets/auth/custombuttonauth.dart';
import '../../widgets/auth/custompasswordtextform.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => LoginControllerImp());
    // TODO: implement build
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColor.backGroundColor,
      appBar: CustomAppBarAuth(
        title: "26".tr,
      ),
      body: GetBuilder<LoginControllerImp>(
        builder: (controller) => HandlingDataRequest(
          statusRequest: controller.statusRequest,
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
