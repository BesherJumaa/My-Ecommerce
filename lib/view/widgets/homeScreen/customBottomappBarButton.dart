// ignore_for_file: file_names

import 'package:ecommercecourse/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomBottomAppBarButton extends StatelessWidget {
  final String title;
  final IconData? icon;
  final void Function()? onPressed;
  final bool active;
  final Color color = AppColor.black;
  const CustomBottomAppBarButton(
      {super.key,
      required this.title,
      required this.icon,
      required this.onPressed,
      required this.active});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      child: InkWell(
        onTap: onPressed,
        child: Column(
          // mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: active == true ? AppColor.primaryColor : color,
            ),
            Text(
              title,
              style: TextStyle(
                color: active == true ? AppColor.primaryColor : color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
