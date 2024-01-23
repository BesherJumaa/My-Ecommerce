import 'package:ecommercecourse/controller/items_controller.dart';
import 'package:ecommercecourse/core/functions/translate_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/constant/color.dart';
import '../../../../data/model/categories_model.dart';

class ListCategoriesItems extends GetView<ItemsControllerImp> {
  const ListCategoriesItems({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 120,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: ListView.separated(
          separatorBuilder: (context, index) => const SizedBox(
                width: 10,
              ),
          itemCount: controller.categories.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return CategoriesItems(
                index: index,
                categoriesModel:
                    CategoriesModel.fromJson(controller.categories[index]));
          }),
    );
  }
}

class CategoriesItems extends GetView<ItemsControllerImp> {
  final CategoriesModel categoriesModel;
  final int? index;

  const CategoriesItems(
      {super.key, required this.categoriesModel, required this.index});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
      onTap: () {
        // controller.goToCategory(controller.categories, index);
        controller.changeCat(index!, categoriesModel.categoriesId!);
      },
      child: Column(
        children: [
          GetBuilder<ItemsControllerImp>(builder: (controller) {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: controller.selectedCat == index
                  ? const BoxDecoration(
                      border: Border(
                        bottom:
                            BorderSide(width: 3, color: AppColor.primaryColor),
                      ),
                    )
                  : null,
              child: Text(
                translateDatabase(categoriesModel.categoriesNameAr!,
                    categoriesModel.categoriesName!),
                style: const TextStyle(fontSize: 20),
              ),
            );
          }),
        ],
      ),
    );
  }
}
