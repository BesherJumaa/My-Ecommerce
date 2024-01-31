import 'package:ecommercecourse/controller/auth/signupcontroller.dart';
import 'package:ecommercecourse/core/class/handlingdataview.dart';
import 'package:ecommercecourse/view/widgets/Auth/customtextbodyauth.dart';
import 'package:ecommercecourse/view/widgets/Auth/customtextform.dart';
import 'package:ecommercecourse/view/widgets/Auth/customtitleauth.dart';
import 'package:ecommercecourse/view/widgets/auth/customappbarauth.dart';
import 'package:ecommercecourse/view/widgets/auth/noaccountauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constant/color.dart';
import '../../../core/functions/validinput.dart';
import '../../widgets/auth/custombuttonauth.dart';
import '../../widgets/auth/custompasswordtextform.dart';
import '../../widgets/auth/logoauthh.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    Get.lazyPut(() => SignUpControllerImp());
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      backgroundColor: AppColor.backGroundColor,
      appBar: CustomAppBarAuth(title: "17".tr),
      body: SingleChildScrollView(
        child: GetBuilder<SignUpControllerImp>(
          builder: (controller) => HandlingDataRequest(
            statusRequest: controller.statusRequest,
            widget: Form(
              key: controller.formState,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 35, vertical: 15),
                child: Column(
                  children: [
                    CustomTitleAuth(title: "10".tr),
                    const LogoAuthh(),
                    CustomTextBodyAuth(body: "24".tr),
                    const SizedBox(
                      height: 15,
                    ),
                    AuthTextFormField(
                      validator: (val) {
                        return validInput(val!, 5, 50, "username");
                      },
                      mycontroller: controller.username,
                      textBox: "23".tr,
                      hintText: "20".tr,
                      iconPrefix: Icons.person_outline,
                    ),
                    AuthTextFormField(
                        validator: (val) {
                          return validInput(val!, 5, 50, "phone");
                        },
                        keyboardtype: const TextInputType.numberWithOptions(
                            decimal: true),
                        mycontroller: controller.phone,
                        textBox: "22".tr,
                        hintText: "21".tr,
                        iconPrefix: Icons.phone_outlined),
                    AuthTextFormField(
                      keyboardtype: TextInputType.emailAddress,
                      validator: (val) {
                        return validInput(val!, 5, 50, "email");
                      },
                      mycontroller: controller.email,
                      textBox: "12".tr,
                      hintText: "18".tr,
                      iconPrefix: Icons.email_outlined,
                    ),
                    AuthPasswordTextFormField(
                      validator: (val) {
                        return validInput(val!, 5, 50, "password");
                      },
                      // secure: controller.secure.value,
                      // onIconPressed: controller.secures(controller.secure.value),
                      mycontroller: controller.password,
                      textBox: "13".tr,
                      hintText: "19".tr,
                    ),
                    AuthPasswordTextFormField(
                      validator: (val) {
                        return validInput(val!, 5, 50, "password");
                      },
                      // secure: controller.secure.value,
                      // onIconPressed: controller.secures(controller.secure.value),
                      mycontroller: controller.repassword,
                      textBox: "13".tr,
                      hintText: "19".tr,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomBottomAuth(
                      text: '17'.tr,
                      onPressed: () {
                        controller.signUp();
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    NoAccountAuth(
                      text: "25".tr,
                      buttonText: "26".tr,
                      onTap: () {
                        controller.toLogin();
                      },
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
