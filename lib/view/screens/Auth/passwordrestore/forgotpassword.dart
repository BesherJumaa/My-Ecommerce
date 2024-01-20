import 'package:ecommercecourse/core/class/handlingdataview.dart';
import 'package:ecommercecourse/view/widgets/Auth/customtextbodyauth.dart';
import 'package:ecommercecourse/view/widgets/Auth/customtextform.dart';
import 'package:ecommercecourse/view/widgets/Auth/customtitleauth.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/auth/passwordrestore/forgotpassword_controller.dart';
import '../../../../core/constant/color.dart';

import '../../../../core/functions/validinput.dart';
import '../../../widgets/auth/custombuttonauth.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // ForgotPasswordControllerImp controller =
    Get.put(ForgotPasswordControllerImp());
    return Scaffold(
      backgroundColor: AppColor.backGroundColor,
      appBar: AppBar(
        foregroundColor: AppColor.primaryColor,
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: AppColor.backGroundColor,
        title: Text(
          "Sign Up",
          style: Theme.of(context).textTheme.headline1!.copyWith(
                color: AppColor.gray,
              ),
        ),
      ),
      body: GetBuilder<ForgotPasswordControllerImp>(
        builder: (controller) => HandlingDataRequest(
          statusRequest: controller.statusRequest,
          widget: Form(
            key: controller.formState,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 15),
              child: Column(
                children: [
                  const CustomTitleAuth(title: "Forgot Password"),
                  // const LogoAuth(),
                  const CustomTextBodyAuth(
                      body:
                          "Please Enter Your Email Address \nTo Receive A Verification Code."),
                  const SizedBox(
                    height: 20,
                  ),

                  AuthTextFormField(
                    validator: (val) {
                      return validInput(val!, 5, 50, "email");
                    },
                    keyboardtype: TextInputType.emailAddress,
                    mycontroller: controller.email,
                    textBox: "Email",
                    hintText: "Enter Your Email",
                    iconPrefix: Icons.email_outlined,
                  ),

                  const SizedBox(
                    height: 10,
                  ),
                  CustomBottomAuth(
                    text: 'Check',
                    onPressed: () {
                      controller.goToVerifyCode();
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
