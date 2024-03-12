import 'package:ecommercecourse/core/class/handlingdataview.dart';
import 'package:ecommercecourse/view/widgets/orders/archive_button.dart';
import 'package:ecommercecourse/view/widgets/orders/orders_card_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/orders/order_pending_controller.dart';

class OrdersPending extends StatelessWidget {
  const OrdersPending({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrdersPendingController());
    return GetBuilder<OrdersPendingController>(builder: (controller) {
      return Scaffold(
          floatingActionButtonLocation: FloatingActionButtonLocation.centerTop,
          floatingActionButton: controller.show
              ? ArchiveButton(onPressed: () {
                  // controller.archived =true;
                  controller.goToArchivedOrders();
                })
              : null,
          body: RefreshIndicator(
            onRefresh: () async {
              controller.showWidget(controller.show);
            },
            child: HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: Padding(
                padding: controller.show
                    ? const EdgeInsets.only(top: 40)
                    : const EdgeInsets.only(top: 1),
                child: ListView.builder(
                  itemCount: controller.data.length,
                  itemBuilder: ((context, index) =>
                      CardOrdersList(ordersModel: controller.data[index])),
                ),
              ),
            ),
          ));
    });
  }
}
