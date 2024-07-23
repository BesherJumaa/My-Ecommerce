// ignore_for_file: deprecated_member_use

import 'package:ecommercecourse/controller/auth/verifysignup/verifycodesignup_controller.dart';
import 'package:ecommercecourse/core/class/handlingdataview.dart';
import 'package:ecommercecourse/view/widgets/Auth/custom_text_body_auth.dart';
import 'package:ecommercecourse/view/widgets/Auth/custom_title_auth.dart';

import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

import '../../../../core/constant/color.dart';

class VerifyCodeSignUp extends StatelessWidget {
  const VerifyCodeSignUp({super.key});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    Get.put(VerifyCodeSignUpControllerImp());
    return Scaffold(
      backgroundColor: AppColor.backGroundColor,
      appBar: AppBar(
        foregroundColor: AppColor.primaryColor,
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: AppColor.backGroundColor,
        title: Text(
          "51".tr,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: AppColor.gray,
              ),
        ),
      ),
      body: GetBuilder<VerifyCodeSignUpControllerImp>(
        builder: (controller) => HandlingDataRequest(
          statusRequest: controller.statusRequest,
          widget: Container(
            padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 15),
            child: RefreshIndicator(
              onRefresh: () async {
                controller.resend();
              },
              child: SingleChildScrollView(
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomTitleAuth(title: "27".tr),
                    // const LogoAuth(),
                    Center(
                      child: CustomTextBodyAuth(
                          body:
                              "Please Enter The Digit Code Sent To \n ${controller.email}          "),
                    ),
                    const SizedBox(
                      height: 20,
                    ),

                    Directionality(
                      textDirection: TextDirection.ltr,
                      child: OtpTextField(
                        fieldWidth: 50.0,
                        borderRadius: BorderRadius.circular(20),
                        numberOfFields: 5,
                        borderColor: const Color(0xFF512DA8),
                        //set to true to show as box or false to show as dash
                        showFieldAsBox: true,
                        //runs when a code is typed in
                        onCodeChanged: (String code) {
                          //handle validation or checks here
                        },
                        //runs when every textField is filled
                        onSubmit: (String verificationCode) {
                          controller.goToSuccessSignUp(verificationCode);
                        }, // end onSubmit
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        controller.resend();
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.refresh_outlined),
                          Text("52".tr),
                        ],
                      ),
                    ),
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
