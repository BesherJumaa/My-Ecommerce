import 'package:ecommercecourse/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/constant/color.dart';

class CustomCardHome extends GetView<HomeControllerImp> {
  final String title;
  final String body;

  const CustomCardHome({super.key, required this.title, required this.body});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: Stack(
        children: [
          Container(
            height: 160,
            decoration: BoxDecoration(
                color: AppColor.primaryColor,
                borderRadius: BorderRadius.circular(25)),
            child: Shimmer.fromColors(
              period: const Duration(seconds: 10),
              // loop: 5,
              baseColor: AppColor.white,
              highlightColor: AppColor.thirdColor,
              child: ListTile(
                title: Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    body,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: -40,
            right: controller.lang == "en" ? -20 : null,
            left: controller.lang == "ar" ? -20 : null,
            child: Container(
              height: 140,
              width: 140,
              decoration: BoxDecoration(
                  color: AppColor.secondColor,
                  borderRadius: BorderRadius.circular(160)),
            ),
          ),
        ],
      ),
    );
  }
}
