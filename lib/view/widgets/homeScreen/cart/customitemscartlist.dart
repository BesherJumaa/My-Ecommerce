import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommercecourse/core/constant/color.dart';
import 'package:ecommercecourse/linkapi.dart';
import 'package:flutter/material.dart';

class CustomItemsCartList extends StatelessWidget {
  final String name;
  final String price;
  final String count;
  final String imageName;
  final Function()? onAdd;
  final Function()? onRemove;
  final Function()? onTapItem;

  final String itemId;

  const CustomItemsCartList({
    Key? key,
    required this.name,
    required this.price,
    required this.count,
    required this.imageName,
    required this.onAdd,
    required this.onRemove,
    required this.itemId,
    this.onTapItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTapItem,
      child: Card(
        child: Row(children: [
          Expanded(
              flex: 2,
              child: Hero(
                tag: itemId,
                child: CachedNetworkImage(
                  height: 90,
                  fit: BoxFit.cover,
                  imageUrl: "${AppLink.imageItems}/$imageName",
                ),
              )),
          Expanded(
              flex: 3,
              child: ListTile(
                title: Text(name, style: const TextStyle(fontSize: 15)),
                subtitle: Text(price,
                    style: const TextStyle(
                        color: AppColor.primaryColor, fontSize: 17)),
              )),
          Expanded(
              child: Column(
            children: [
              SizedBox(
                  height: 40,
                  child: IconButton(
                      onPressed: onAdd,
                      icon: const Icon(
                        Icons.add,
                        color: AppColor.primaryColor,
                      ))),
              SizedBox(
                height: 20,
                width: 20,
                child: Text(
                  count,
                  style: const TextStyle(fontFamily: "sans"),
                ),
              ),
              SizedBox(
                  height: 30,
                  child: IconButton(
                      onPressed: onRemove,
                      icon: const Icon(
                        Icons.remove,
                        color: AppColor.primaryColor,
                      )))
            ],
          ))
        ]),
      ),
    );
  }
}
