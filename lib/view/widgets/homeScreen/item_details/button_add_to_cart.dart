import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constant/color.dart';

class ButtonAddToCart extends StatelessWidget {
  const ButtonAddToCart({super.key, required this.onPressed});
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
      height: 40,
      child: MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        color: AppColor.secondColor,
        onPressed: onPressed,
        child: Text(
          "50".tr,
          style: const TextStyle(
              fontWeight: FontWeight.bold, color: AppColor.white),
        ),
      ),
    );
  }
}
