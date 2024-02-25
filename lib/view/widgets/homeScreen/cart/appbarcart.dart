import 'package:flutter/material.dart';

import '../../../../core/constant/color.dart';

class TopAppbarCart extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const TopAppbarCart({Key? key, required this.title}) : super(key: key);
  @override
  Size get preferredSize => AppBar().preferredSize;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Container(
        margin: const EdgeInsets.symmetric(horizontal: 100),
        child: Center(
          child: Text(
            title,
            style: const TextStyle(fontSize: 25, color: AppColor.white),
          ),
        ),
      ),
      // leading: IconButton(
      //     onPressed: () {
      //       Get.back();
      //     },
      //     icon: const Icon(Icons.arrow_back_outlined)),
    );
  }
}
