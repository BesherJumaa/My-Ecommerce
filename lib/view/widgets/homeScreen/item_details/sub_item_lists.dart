import 'package:ecommercecourse/controller/item_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constant/color.dart';

class SubItemsLists extends GetView<ItemDetailsControllerImp> {
  const SubItemsLists({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(children: [
      ...List.generate(
        controller.subItems.length,
        (index) => Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.only(right: 10, top: 10),
          padding: const EdgeInsets.only(bottom: 5),
          height: 60,
          width: 60,
          decoration: BoxDecoration(
              color: controller.subItems[index]['active']
                  ? AppColor.fourthColor
                  : null,
              border: Border.all(
                color: AppColor.fourthColor,
              ),
              borderRadius: BorderRadius.circular(10)),
          child: Text(
            controller.subItems[index]['name'],
            style: TextStyle(
                color: controller.subItems[index]['active']
                    ? AppColor.white
                    : AppColor.fourthColor),
          ),
        ),
      ),
    ]);
  }
}
