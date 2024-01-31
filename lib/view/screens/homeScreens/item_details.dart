import 'package:ecommercecourse/controller/item_details_controller.dart';
import 'package:ecommercecourse/view/widgets/homeScreen/item_details/button_add_to_cart.dart';
import 'package:ecommercecourse/view/widgets/homeScreen/item_details/sub_item_lists.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widgets/homeScreen/item_details/body_item_details.dart';
import '../../widgets/homeScreen/item_details/top_item_details.dart';

class ItemDetails extends StatelessWidget {
  const ItemDetails({super.key});

  @override
  Widget build(BuildContext context) {
    ItemDetailsControllerImp controller = Get.put(ItemDetailsControllerImp());
    return Scaffold(
      bottomNavigationBar: const ButtonAddToCart(),
      body: RefreshIndicator(
        onRefresh: () async {
          controller.initialData();
        },
        child: ListView(
          children: const [
            TopItemDetails(),
            SizedBox(
              height: 100,
            ),
            BodyItemDetails(),
            SubItemsLists(),
          ],
        ),
      ),
    );
  }
}
