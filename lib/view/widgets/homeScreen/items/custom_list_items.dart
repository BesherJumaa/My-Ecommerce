import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommercecourse/core/functions/translate_database.dart';
import 'package:ecommercecourse/data/model/items_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/items_controller.dart';
import '../../../../core/constant/color.dart';
import '../../../../linkapi.dart';

class CustomListItems extends GetView<ItemsControllerImp> {
  const CustomListItems({super.key, required this.itemsModel});
  final ItemsModel itemsModel;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CachedNetworkImage(
              imageUrl: '${AppLink.imageItems}/${itemsModel.itemsImage}',
              height: 100,
              fit: BoxFit.fill,
            ),
            Text(
              "${translateDatabase(itemsModel.itemsNameAr, itemsModel.itemsName)}",
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Rating",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20),
                  ),
                  Container(
                    alignment: Alignment.bottomCenter,
                    child: Row(
                      children: [
                        ...List.generate(
                            5,
                            (index) => const Icon(
                                  Icons.star,
                                  size: 15,
                                ))
                      ],
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text(
                  "${itemsModel.itemsPrice} \$",
                  style: const TextStyle(color: AppColor.primaryColor),
                ),
                IconButton(
                    onPressed: () {
                      controller.changeFavorite(controller.favorite);
                    },
                    icon: controller.favorite == true
                        ? const Icon(
                            Icons.favorite,
                            color: AppColor.primaryColor,
                          )
                        : const Icon(
                            Icons.favorite_border_outlined,
                            color: AppColor.primaryColor,
                          ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
