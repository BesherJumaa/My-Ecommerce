// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

class CustomAppBarAuth extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const CustomAppBarAuth({super.key, required this.title});

  @override
  Size get preferredSize => AppBar().preferredSize;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AppBar(
      elevation: 0.0,
      centerTitle: true,
      backgroundColor: AppColor.backGroundColor,
      title: Text(
        title,
        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: AppColor.gray,
            ),
      ),
    );
  }
}
