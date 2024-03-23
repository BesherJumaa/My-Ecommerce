import 'package:ecommercecourse/controller/home_controller.dart';
import 'package:ecommercecourse/core/functions/translate_database.dart';
import 'package:ecommercecourse/data/model/items_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../../../../core/constant/color.dart';
import '../../../../core/constant/imageassets.dart';
import '../../../../linkapi.dart';

class ListItemsHome extends GetView<HomeControllerImp> {
  const ListItemsHome({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SizedBox(
      height: 220,
      child: ListView.builder(
          itemCount: controller.items.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, i) =>
              ItemsHome(itemsModel: ItemsModel.fromJson(controller.items[i]))),
    );
  }
}

class ItemsHome extends GetView<HomeControllerImp> {
  final ItemsModel itemsModel;

  const ItemsHome({super.key, required this.itemsModel});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
      onTap: () {
        controller.goToProductDetails(itemsModel);
      },
      child: Stack(
        children: [
          Positioned(
            top: 15,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
              child: Hero(
                tag: "${itemsModel.itemsId}",
                child: Image.network(
                  "${AppLink.imageItems}/${itemsModel.itemsImage}",
                  height: 100,
                  width: 150,
                  fit: BoxFit.fill,
                  loadingBuilder: (BuildContext context, Widget child,
                      ImageChunkEvent? loadingProgress) {
                    if (loadingProgress == null) {
                      return child;
                    } else {
                      // While the image is still loading, show a loading indicator
                      return Center(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 12, horizontal: 12),
                          width: 100, // Adjust the width as needed
                          height: 100, // Adjust the height as needed
                          child: CircularProgressIndicator(
                            value: loadingProgress.expectedTotalBytes != null
                                ? loadingProgress.cumulativeBytesLoaded /
                                    (loadingProgress.expectedTotalBytes ?? 1)
                                : null,
                          ),
                        ),
                      );
                    }
                  },
                  errorBuilder: (BuildContext context, Object error,
                      StackTrace? stackTrace) {
                    // Handle the error, e.g., show a placeholder or default image
                    return Center(
                        heightFactor: 100,
                        widthFactor: 150,
                        child: Lottie.asset(AppImageAssets.server));
                  },
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            margin: const EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: AppColor.black.withOpacity(0.05),
            ),
            height: 130,
            width: 170,
          ),
          Positioned(
            left: 10,
            child: Text(
              "${translateDatabase(itemsModel.itemsNameAr, itemsModel.itemsName)}",
              style: const TextStyle(color: AppColor.black),
            ),
          )
        ],
      ),
    );
  }
}
