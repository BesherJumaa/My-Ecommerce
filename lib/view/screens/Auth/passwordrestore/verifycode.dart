// ignore_for_file: deprecated_member_use

import 'package:ecommercecourse/controller/auth/passwordrestore/verifycode_controller.dart';
import 'package:ecommercecourse/core/class/handlingdataview.dart';
import 'package:ecommercecourse/view/widgets/Auth/customtextbodyauth.dart';
import 'package:ecommercecourse/view/widgets/Auth/customtitleauth.dart';

import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

import '../../../../core/constant/color.dart';

class VerifyCode extends StatelessWidget {
  const VerifyCode({super.key});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    Get.put(VerifyCodeControllerImp());
    return Scaffold(
      backgroundColor: AppColor.backGroundColor,
      appBar: AppBar(
        foregroundColor: AppColor.primaryColor,
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: AppColor.backGroundColor,
        title: Text(
          "Verification Code",
          style: Theme.of(context).textTheme.headline1!.copyWith(
                color: AppColor.gray,
              ),
        ),
      ),
      body: GetBuilder<VerifyCodeControllerImp>(
          builder: (controller) => HandlingDataRequest(
                statusRequest: controller.statusRequest,
                widget: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 35, vertical: 15),
                  child: Column(
                    children: [
                      const CustomTitleAuth(title: "Check Code"),
                      // const LogoAuth(),
                      const CustomTextBodyAuth(
                          body: "Please Enter The Digit Code Sent To.."),
                      const SizedBox(
                        height: 20,
                      ),

                      OtpTextField(
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
                          controller.goToResetPassword(verificationCode);
                        }, // end onSubmit
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              )),
    );
  }
}
