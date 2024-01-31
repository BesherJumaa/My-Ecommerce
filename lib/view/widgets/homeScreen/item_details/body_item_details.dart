// ignore_for_file: deprecated_member_use

import 'package:ecommercecourse/controller/item_details_controller.dart';
import 'package:ecommercecourse/view/widgets/homeScreen/item_details/price_and_count.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constant/color.dart';
import '../../../../core/functions/translate_database.dart';

class BodyItemDetails extends GetView<ItemDetailsControllerImp> {
  const BodyItemDetails({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${translateDatabase(controller.itemsModel.itemsNameAr, controller.itemsModel.itemsName)}",
            style: Theme.of(context)
                .textTheme
                .headline1
                ?.copyWith(color: AppColor.fourthColor),
          ),
          const SizedBox(
            height: 10,
          ),
          PriceAndCountItems(
              onAdd: () {}, onRemove: () {}, price: "300.0", count: "2"),
          Text(
              "${translateDatabase(controller.itemsModel.itemsDescAr, controller.itemsModel.itemsDesc)}",
              style: Theme.of(context).textTheme.bodyText1),
          const SizedBox(
            height: 10,
          ),
          Text(
            "39".tr,
            style: Theme.of(context)
                .textTheme
                .headline1
                ?.copyWith(color: AppColor.fourthColor),
          ),
        ],
      ),
    );
  }
}
