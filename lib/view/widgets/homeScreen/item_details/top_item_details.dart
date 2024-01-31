import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommercecourse/controller/item_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constant/color.dart';
import '../../../../linkapi.dart';

class TopItemDetails extends GetView<ItemDetailsControllerImp> {
  const TopItemDetails({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: 200,
          decoration: const BoxDecoration(
              color: AppColor.secondColor,
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(30))),
        ),
        Positioned(
          top: Get.height / 20,
          right: Get.width / 4,
          left: Get.width / 4,
          child: Hero(
            tag: "${controller.itemsModel.itemsId}",
            child: CachedNetworkImage(
              imageUrl:
                  "${AppLink.imageItems}/${controller.itemsModel.itemsImage}",
              height: 280,
              fit: BoxFit.scaleDown,
            ),
          ),
        ),
      ],
    );
  }
}
