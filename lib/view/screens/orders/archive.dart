// ignore_for_file: deprecated_member_use

import 'package:ecommercecourse/core/class/handlingdataview.dart';
import 'package:ecommercecourse/view/widgets/orders/archive_button.dart';
import 'package:ecommercecourse/view/widgets/orders/orders_card_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/orders/order_pending_controller.dart';

class OrdersArchive extends StatelessWidget {
  const OrdersArchive({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrdersPendingController());
    return GetBuilder<OrdersPendingController>(builder: (controller) {
      return Scaffold(
          appBar: AppBar(
            title: Text("115".tr),
            leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  controller.goToPendingOrders();
                }),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerTop,
          floatingActionButton: controller.show
              ? ArchiveButton(onPressed: () {
                  controller.goToArchivedOrders();
                })
              : null,
          body: WillPopScope(
            onWillPop: () {
              return controller.goToPendingOrders();
            },
            child: RefreshIndicator(
              onRefresh: () async {
                controller.getArchivedData();
              },
              child: HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: Padding(
                  padding: controller.show
                      ? const EdgeInsets.only(top: 40)
                      : const EdgeInsets.only(top: 1),
                  child: ListView.builder(
                    itemCount: controller.dataArchive.length,
                    itemBuilder: ((context, index) => CardOrdersList(
                        ordersModel: controller.dataArchive[index])),
                  ),
                ),
              ),
            ),
          ));
    });
  }
}
