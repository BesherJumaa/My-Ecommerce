import 'package:ecommercecourse/core/constant/color.dart';
import 'package:ecommercecourse/view/widgets/orders/orders_rating.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

import '../../../controller/orders/order_pending_controller.dart';
import '../../../core/constant/routes.dart';
import '../../../data/model/orders_model.dart';

class CardOrdersList extends GetView<OrdersPendingController> {
  final OrdersModel ordersModel;
  const CardOrdersList({Key? key, required this.ordersModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                      "131"
                          .trParams({"count": ordersModel.ordersId.toString()}),
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold)),
                  const Spacer(),
                  // Text(listdata.ordersDatetime!)
                  Text(
                    Jiffy(ordersModel.ordersDatetime!, "yyyy-MM-dd").fromNow(),
                    style: const TextStyle(
                        color: AppColor.primaryColor,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
              const Divider(),
              Text("124".trParams({
                "count": controller.printOrderType(ordersModel.ordersType!)
              })),
              Text("125"
                  .trParams({"count": ordersModel.ordersPrice.toString()})),
              Text("126".trParams(
                  {"count": ordersModel.ordersPricedelivery.toString()})),
              Text("127".trParams({
                "count": controller
                    .printPaymentMethod(ordersModel.ordersPaymentmethod!)
                    .toString()
              })),
              Text("128".trParams({
                "count": controller
                    .printOrderStatus(ordersModel.ordersStatus!)
                    .toString()
              })),
              const Divider(),
              Row(
                children: [
                  Text(
                      "123".trParams(
                          {"count": ordersModel.ordersTotalprice.toString()}),
                      style: const TextStyle(
                          color: AppColor.primaryColor,
                          fontWeight: FontWeight.bold)),
                  const Spacer(),
                  MaterialButton(
                    onPressed: () {
                      Get.toNamed(AppRoutes.ordersDetails,
                          arguments: {"ordersmodel": ordersModel});
                    },
                    color: AppColor.thirdColor,
                    textColor: AppColor.secondColor,
                    child: Text("129".tr,
                        style: const TextStyle(color: AppColor.white)),
                  ),
                  const SizedBox(width: 10),
                  if (ordersModel.ordersStatus! == "0")
                    MaterialButton(
                      onPressed: () {
                        controller.confirmDeleteOrder(ordersModel.ordersId!);
                      },
                      color: AppColor.thirdColor,
                      textColor: AppColor.secondColor,
                      child: Text(
                        "130".tr,
                        style: const TextStyle(color: AppColor.white),
                      ),
                    ),
                  if (ordersModel.ordersStatus! == "4" &&
                      ordersModel.ordersRating == "0")
                    MaterialButton(
                      onPressed: () {
                        showRatingDialog(context, ordersModel.ordersId!);
                      },
                      color: AppColor.thirdColor,
                      textColor: AppColor.secondColor,
                      child: Text(
                        "47".tr,
                        style: const TextStyle(color: AppColor.white),
                      ),
                    ),
                ],
              ),
            ],
          )),
    );
  }
}
