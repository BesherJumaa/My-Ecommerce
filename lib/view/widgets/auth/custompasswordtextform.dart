import 'package:ecommercecourse/controller/auth/logincontroller.dart';
import 'package:ecommercecourse/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthPasswordTextFormField extends StatelessWidget {
  final String? textBox;
  final String? hintText;

  final TextEditingController? mycontroller;
  final String? Function(String?)? validator;
  final void Function()? onIconPressed;
  const AuthPasswordTextFormField({
    super.key,
    required this.textBox,
    required this.hintText,
    this.mycontroller,
    this.onIconPressed,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    LoginControllerImp controller = LoginControllerImp();
    return Container(
      margin: const EdgeInsets.only(top: 15),
      child: Obx(
        () => TextFormField(
          controller: mycontroller,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: validator,
          enableSuggestions: true,
          obscureText: controller.secure.value,
          showCursor: false,
          decoration: InputDecoration(
            floatingLabelBehavior: FloatingLabelBehavior.always,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
            label: Container(
                margin: const EdgeInsets.symmetric(horizontal: 7),
                child: Text(textBox!)),
            hintStyle: const TextStyle(fontSize: 14),
            hintText: hintText,
            suffixIcon: IconButton(
              icon: Icon(
                controller.secure.value
                    ? Icons.visibility
                    : Icons.visibility_off,
                // Icons.lock_outline,
                color: AppColor.primaryColor,
              ),
              onPressed: () {
                controller.secure.value = !controller.secure.value;
              },
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
        ),
      ),
    );
  }
}
