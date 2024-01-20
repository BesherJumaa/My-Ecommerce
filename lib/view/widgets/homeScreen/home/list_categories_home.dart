import 'package:ecommercecourse/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../core/constant/color.dart';
import '../../../../data/model/categories_model.dart';
import '../../../../linkapi.dart';

class ListCategoriesHome extends GetView<HomeControllerImp> {
  const ListCategoriesHome({super.key});

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
            return CategoriesHome(
                index: index,
                categoriesModel:
                    CategoriesModel.fromJson(controller.categories[index]));
          }),
    );
  }
}

class CategoriesHome extends GetView<HomeControllerImp> {
  final CategoriesModel categoriesModel;
  final int? index;

  const CategoriesHome(
      {super.key, required this.categoriesModel, required this.index});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
      onTap: () {
        controller.goToCategory(controller.categories, index);
      },
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            height: 70,
            width: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: AppColor.thirdColor,
            ),
            child: SvgPicture.network(
                "${AppLink.imageCategories}/${categoriesModel.categoriesImage}"),
          ),
          Text(categoriesModel.categoriesName!),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
