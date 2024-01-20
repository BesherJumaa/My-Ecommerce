import 'package:ecommercecourse/controller/items_controller.dart';
import 'package:ecommercecourse/core/constant/color.dart';
import 'package:ecommercecourse/linkapi.dart';
import 'package:ecommercecourse/view/widgets/custom_app_bar.dart';
import 'package:ecommercecourse/view/widgets/homeScreen/home/customappbar.dart';
import 'package:ecommercecourse/view/widgets/homeScreen/home/list_categories_home.dart';
import 'package:ecommercecourse/view/widgets/homeScreen/items/list_categories_items.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:cached_network_image/cached_network_image.dart';

class Items extends StatelessWidget {
  const Items({super.key});

  @override
  Widget build(BuildContext context) {
    ItemsControllerImp contrller = Get.put(ItemsControllerImp());
    return Scaffold(
      appBar: const CustomAppBarHome(),
      body: ListView(
        children: [
          CustomSearchBar(
            titleAppBar: "Find Product",
          ),
          SizedBox(
            height: 20,
          ),
          ListCategoriesItems(),
          GridView.builder(
            itemCount: 2,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, childAspectRatio: 0.7),
            itemBuilder: (BuildContext context, index) {
              return InkWell(
                child: Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CachedNetworkImage(
                        imageUrl: AppLink.imageItems + '/laptop.png',
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "Blah Blah Blah",
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "Blah Blah Blah",
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      GetBuilder<ItemsControllerImp>(builder: (controller) {
                        return Row(
                          children: [
                            const Text(
                              "Price :",
                              style: TextStyle(color: AppColor.primaryColor),
                            ),
                            IconButton(
                                onPressed: () {
                                  controller
                                      .changeFavorite(controller.favorite);
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
                        );
                      })
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
