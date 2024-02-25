import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommercecourse/controller/home_controller.dart';

class CustomAppBarHome extends GetView<HomeControllerImp>
    implements PreferredSizeWidget {
  const CustomAppBarHome({super.key});

  @override
  Size get preferredSize => AppBar().preferredSize;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        "${controller.username}",
      ),
      actions: [
        Column(
          children: [
            Text("${controller.id}"),
            Text("${controller.phone}"),
          ],
        )
      ],
    );
  }
}
