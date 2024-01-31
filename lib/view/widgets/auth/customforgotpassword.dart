import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';

class CustomForgotPassword extends StatelessWidget {
  final void Function()? onTap;

  const CustomForgotPassword({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
        onTap: onTap,
        child: Text(
          "14".tr,
          textAlign: TextAlign.right,
          style: const TextStyle(color: AppColor.gray),
        ));
  }
}
