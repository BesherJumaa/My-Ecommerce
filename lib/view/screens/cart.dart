// ignore_for_file: prefer_const_constructors

import 'package:ecommercecourse/controller/cart_controller.dart';
import 'package:ecommercecourse/core/class/handlingdataview.dart';
import 'package:ecommercecourse/core/functions/translate_database.dart';
import 'package:ecommercecourse/data/model/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/homeScreen/cart/appbarcart.dart';
import '../widgets/homeScreen/cart/custom_bottom_navgationbar_cart.dart';
import '../widgets/homeScreen/cart/customitemscartlist.dart';
import '../widgets/homeScreen/cart/topcardCart.dart';

class Cart extends StatelessWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(CartControllerImp());
    CartModel cartModel;
    int shipping = 300;
    return Scaffold(
        bottomNavigationBar:
            GetBuilder<CartControllerImp>(builder: (controller) {
          return BottomNavigationBarCart(
              price: "${controller.totalPrice}",
              shipping: "$shipping",
              totalPrice: "${controller.totalPrice + shipping}");
        }),
        appBar: TopAppbarCart(
          title: '73'.tr,
        ),
        body: GetBuilder<CartControllerImp>(builder: (controller) {
          return RefreshIndicator(
            onRefresh: () async {
              controller.initialData();
            },
            child: HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: ListView(
                children: [
                  SizedBox(height: 20),
                  TopCardCart(
                      message: "77".trParams(
                          {"count": controller.totalcountItems.toString()})),
                  SizedBox(height: 10),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        ...List.generate(controller.data.length, (index) {
                          cartModel = controller.data[index];
                          return CustomItemsCartList(
                            itemId: cartModel.itemsId!,
                            name: translateDatabase(
                                cartModel.itemsNameAr!, cartModel.itemsName!),
                            price: cartModel.itemsPrice!,
                            count: cartModel.countitems!,
                            imageName: cartModel.itemsImage!,
                            onAdd: () async {
                              await controller
                                  .add(controller.data[index].itemsId);
                              controller.refreshPage();
                            },
                            onRemove: () async {
                              await controller
                                  .remove(controller.data[index].itemsId);
                              controller.refreshPage();
                            },
                          );
                        }),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        }));
  }
}
