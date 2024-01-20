import 'package:ecommercecourse/controller/home_controller.dart';
import 'package:ecommercecourse/data/model/items_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/constant/color.dart';
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
      onTap: () {},
      child: Stack(
        children: [
          Positioned(
            top: 10,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
              child: Image.network(
                "${AppLink.imageItems}/${itemsModel.itemsImage}",
                height: 100,
                width: 150,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            margin: const EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: AppColor.black.withOpacity(0.2),
            ),
            height: 130,
            width: 170,
          ),
          Positioned(
              left: 10,
              // height: 40,
              child: Text(
                "${itemsModel.itemsName}",
                style: const TextStyle(color: AppColor.white),
              ))
        ],
      ),
    );
  }
}
