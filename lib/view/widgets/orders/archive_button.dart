import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constant/color.dart';

class ArchiveButton extends StatelessWidget {
  final Function()? onPressed;
  const ArchiveButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialButton(
      height: 50,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      color: AppColor.secondColor,
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "115".tr,
            style: const TextStyle(
                color: AppColor.white,
                fontWeight: FontWeight.bold,
                fontSize: 25),
          ),
          const SizedBox(
            width: 100,
          ),
          const Icon(
            Icons.archive_outlined,
            color: AppColor.white,
            size: 50,
          )
        ],
      ),
    );
  }
}
