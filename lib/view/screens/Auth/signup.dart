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
      appBar: const CustomAppBarAuth(title: "Sign Up"),
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
                    const CustomTitleAuth(title: "Welcome Back"),
                    const LogoAuthh(),
                    const CustomTextBodyAuth(
                        body:
                            "Sign in with your Email and Password \n or continue with social media."),
                    const SizedBox(
                      height: 15,
                    ),
                    AuthTextFormField(
                      validator: (val) {
                        return validInput(val!, 5, 50, "username");
                      },
                      mycontroller: controller.username,
                      textBox: "Username",
                      hintText: "Enter Your Username",
                      iconPrefix: Icons.person_outline,
                    ),
                    AuthTextFormField(
                        validator: (val) {
                          return validInput(val!, 5, 50, "phone");
                        },
                        keyboardtype: const TextInputType.numberWithOptions(
                            decimal: true),
                        mycontroller: controller.phone,
                        textBox: "Phone",
                        hintText: "Enter Your Phone",
                        iconPrefix: Icons.phone_outlined),
                    AuthTextFormField(
                      keyboardtype: TextInputType.emailAddress,
                      validator: (val) {
                        return validInput(val!, 5, 50, "email");
                      },
                      mycontroller: controller.email,
                      textBox: "Email",
                      hintText: "Enter Your Email",
                      iconPrefix: Icons.email_outlined,
                    ),
                    AuthPasswordTextFormField(
                      validator: (val) {
                        return validInput(val!, 5, 50, "password");
                      },
                      // secure: controller.secure.value,
                      // onIconPressed: controller.secures(controller.secure.value),
                      mycontroller: controller.password,
                      textBox: "Confirm Password",
                      hintText: "Confirm Your Password",
                    ),
                    AuthPasswordTextFormField(
                      validator: (val) {
                        return validInput(val!, 5, 50, "password");
                      },
                      // secure: controller.secure.value,
                      // onIconPressed: controller.secures(controller.secure.value),
                      mycontroller: controller.repassword,
                      textBox: "Confirm Password",
                      hintText: "Enter Your Password",
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomBottomAuth(
                      text: 'Sign Up',
                      onPressed: () {
                        controller.signUp();
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    NoAccountAuth(
                      text: "Already Have Account ?",
                      buttonText: "Sign In",
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
