import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommercecourse/controller/item_details_controller.dart';
import 'package:ecommercecourse/data/model/items_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/constant/color.dart';
import '../../../../core/constant/imageassets.dart';
import '../../../../linkapi.dart';

class TopItemDetails extends GetView<ItemDetailsControllerImp> {
  const TopItemDetails({
    super.key,
    required this.itemsModel,
  });
  final ItemsModel itemsModel;
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
            tag: "${itemsModel.itemsId}",
            child: CachedNetworkImage(
              imageUrl:
                  "${AppLink.imageItems}/${controller.itemsModel.itemsImage}",
              height: 280,
              fit: BoxFit.scaleDown,
            ),
          ),
        ),
        itemsModel.itemsDiscount != "0"
            ? Positioned(
                height: 100,
                width: 100,
                top: 4,
                child: Lottie.asset(AppImageAssets.sales),
              )
            : Container()
      ],
    );
  }
}
