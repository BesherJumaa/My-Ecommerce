// ignore_for_file: prefer_const_constructors
import 'package:ecommercecourse/core/class/handlingdataview.dart';
import 'package:ecommercecourse/core/constant/imageassets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/checkout_controller.dart';
import '../../core/constant/color.dart';
import '../widgets/checkout/carddeliveerytype.dart';
import '../widgets/checkout/cardshippingaddress.dart';

class Checkout extends StatelessWidget {
  const Checkout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CheckoutControllerImp controller = Get.put(CheckoutControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('103'.tr)),
      ),
      bottomNavigationBar: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: MaterialButton(
            color: AppColor.secondColor,
            textColor: Colors.white,
            onPressed: () {
              controller.checkout();
            },
            child: Text('74'.tr,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          )),
      body: GetBuilder<CheckoutControllerImp>(
          builder: (controller) => HandlingDataView(
              shimmer: true,
              statusRequest: controller.statusRequest,
              onOffline: () {
                controller.onInit();
              },
              widget: Container(
                  padding: const EdgeInsets.all(20),
                  child: RefreshIndicator(
                    onRefresh: () async {
                      controller.onInit();
                    },
                    child: ListView(
                      children: [
                        Text(
                          "104".tr,
                          style: TextStyle(
                              color: AppColor.secondColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            InkWell(
                              onTap: () {
                                controller.choosePaymentMethod("0");
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: controller.deliveryType == "0"
                                      ? AppColor
                                          .primaryColor // Change to your active color
                                      : AppColor
                                          .backGroundColor, // Change to your inactive color
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: CardDeliveryTypeCheckout(
                                    title: "105".tr,
                                    active: controller.paymentMethod == "0"
                                        ? true
                                        : false,
                                    imagename: AppImageAssets.cash,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            InkWell(
                              onTap: () {
                                controller.choosePaymentMethod("1");
                              },
                              child: CardDeliveryTypeCheckout(
                                title: "106".tr,
                                active: controller.paymentMethod == "1"
                                    ? true
                                    : false,
                                imagename: AppImageAssets.card,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Text(
                          "107".tr,
                          style: TextStyle(
                              color: AppColor.secondColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            InkWell(
                              onTap: () {
                                controller.chooseDeliveryType("0");
                              },
                              child: CardDeliveryTypeCheckout(
                                imagename: AppImageAssets.delivery,
                                title: "110".tr,
                                active: controller.deliveryType == "0",
                              ),
                            ),
                            const SizedBox(width: 10),
                            InkWell(
                              onTap: () {
                                controller.chooseDeliveryType("1");
                              },
                              child: CardDeliveryTypeCheckout(
                                imagename: AppImageAssets.noDelivery,
                                title: "109".tr,
                                active: controller.deliveryType == "1",
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        if (controller.deliveryType == "0")
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "108".tr,
                                style: TextStyle(
                                    color: AppColor.secondColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              ),
                              const SizedBox(height: 10),
                              ...List.generate(
                                controller.dataAddress.length,
                                (index) => InkWell(
                                  onTap: () {
                                    controller.chooseShippingAddress(controller
                                        .dataAddress[index].addressId!);
                                  },
                                  child: CardShppingAddressCheckout(
                                      title:
                                          "${controller.dataAddress[index].addressName}",
                                      body:
                                          "${controller.dataAddress[index].addressCity} ${controller.dataAddress[index].addressStreet}",
                                      isactive: controller.addressID ==
                                              controller
                                                  .dataAddress[index].addressId
                                          ? true
                                          : false),
                                ),
                              )
                            ],
                          ),
                        if (controller.dataAddress.isEmpty &&
                            controller.deliveryType == "0")
                          Row(
                            children: [
                              Text(
                                "88".tr,
                                style: TextStyle(color: AppColor.secondColor),
                              ),
                              IconButton(
                                onPressed: () {
                                  controller.addAddress();
                                },
                                icon: Icon(
                                  Icons.add_circle_outline,
                                  color: AppColor.secondColor,
                                  size: 40,
                                ),
                              )
                            ],
                          )
                      ],
                    ),
                  )))),
    );
  }
}
