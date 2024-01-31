import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommercecourse/controller/favorite_controller.dart';
import 'package:ecommercecourse/core/functions/translate_database.dart';
import 'package:ecommercecourse/data/model/items_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../../controller/items_controller.dart';
import '../../../../core/constant/color.dart';
import '../../../../core/constant/imageassets.dart';
import '../../../../linkapi.dart';

class CustomListItems extends GetView<ItemsControllerImp> {
  const CustomListItems({
    super.key,
    required this.itemsModel,
  });
  final ItemsModel itemsModel;
  // final bool active;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
      onTap: () {
        controller.goToProductDetails(itemsModel);
      },
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: "${itemsModel.itemsId}",
              child: CachedNetworkImage(
                imageUrl: '${AppLink.imageItems}/${itemsModel.itemsImage}',
                height: 100,
                fit: BoxFit.fill,
                progressIndicatorBuilder: (BuildContext context, String url,
                    DownloadProgress? loadingProgress) {
                  if (loadingProgress == null) {
                    return Container(
                      color: AppColor.primaryColor,
                    ); // Placeholder, you can customize it
                  } else {
                    // While the image is still loading, show a loading indicator
                    return Center(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 12),
                        width: 100, // Adjust the width as needed
                        height: 100, // Adjust the height as needed
                        child: CircularProgressIndicator(
                          value: loadingProgress.progress,
                        ),
                      ),
                    );
                  }
                },
                errorWidget: (BuildContext context, String url, dynamic error) {
                  // Handle the error, e.g., show a placeholder or default image
                  return Center(
                    heightFactor: 100,
                    widthFactor: 150,
                    child: Lottie.asset(AppImageAssets.server),
                  );
                },
              ),
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
                  Text(
                    "47".tr,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 20),
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
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "${itemsModel.itemsPrice} \$",
                  style: const TextStyle(color: AppColor.primaryColor),
                ),
                GetBuilder<FavoriteControllerImp>(builder: (controller) {
                  return IconButton(
                    onPressed: () {
                      if (controller.isFavorite[itemsModel.itemsId] == "1") {
                        controller.removeFavorite(itemsModel.itemsId!);
                        // controller.setFavorite(itemsModel.itemsId, "0");
                      } else {
                        controller.addFavorite(itemsModel.itemsId!);
                        // controller.setFavorite(itemsModel.itemsId, "1");
                      }
                    },
                    icon: Icon(
                      controller.isFavorite[itemsModel.itemsId] == "1"
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: AppColor.primaryColor,
                    ),
                  );
                }),
              ],
            )
          ],
        ),
      ),
    );
  }
}
