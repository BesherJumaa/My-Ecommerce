import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommercecourse/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../../../../core/constant/color.dart';
import '../../../../core/constant/imageassets.dart';
import '../../../../core/functions/translate_database.dart';
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
        controller.goToCategory(
            controller.categories, index, categoriesModel.categoriesId);
      },
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            height: 60,
            width: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: AppColor.thirdColor,
            ),
            child: buildImageWidget(categoriesModel),
          ),
          Text(translateDatabase(categoriesModel.categoriesNameAr!,
              categoriesModel.categoriesName!)),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}

Widget buildImageWidget(CategoriesModel categoriesModel) {
  if (categoriesModel.categoriesImage!.endsWith('.svg')) {
    // If the image is an SVG file
    return SvgPicture.network(
      "${AppLink.imageCategories}/${categoriesModel.categoriesImage}",
      placeholderBuilder: (BuildContext context) {
        return Center(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
            width: 60,
            height: 70,
            child: const CircularProgressIndicator(),
          ),
        );
      },
      color: AppColor.white,
    );
  } else {
    // If the image is of other types
    return CachedNetworkImage(
      imageUrl: "${AppLink.imageCategories}/${categoriesModel.categoriesImage}",
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
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
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
    );
  }
}
