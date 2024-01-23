import 'package:ecommercecourse/controller/items_controller.dart';
import 'package:ecommercecourse/core/class/handlingdataview.dart';
import 'package:ecommercecourse/data/model/items_model.dart';
import 'package:ecommercecourse/view/widgets/custom_app_bar.dart';
import 'package:ecommercecourse/view/widgets/homeScreen/home/customappbar.dart';
import 'package:ecommercecourse/view/widgets/homeScreen/items/list_categories_items.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widgets/homeScreen/items/custom_list_items.dart';

class Items extends StatelessWidget {
  const Items({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ItemsControllerImp());
    return Scaffold(
      appBar: const CustomAppBarHome(),
      body: GetBuilder<ItemsControllerImp>(builder: (controller) {
        return ListView(
          children: [
            const CustomSearchBar(
              titleAppBar: "Find Product",
            ),
            const SizedBox(
              height: 20,
            ),
            const ListCategoriesItems(),
            HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: GridView.builder(
                  itemCount: controller.data.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, childAspectRatio: 0.7),
                  itemBuilder: (BuildContext context, index) {
                    return CustomListItems(
                      itemsModel: ItemsModel.fromJson(controller.data[index]),
                    );
                  }),
            ),
          ],
        );
      }),
    );
  }
}
