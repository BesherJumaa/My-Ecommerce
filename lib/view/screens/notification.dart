import 'package:ecommercecourse/controller/notification_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/class/handlingdataview.dart';
import '../widgets/notification/card_notifications.dart';

class Notifications extends StatelessWidget {
  const Notifications({super.key});

  @override
  Widget build(BuildContext context) {
    NotificationsController controller = Get.put(NotificationsController());

    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text("142".tr)),
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            controller.onInit();
          },
          child: GetBuilder<NotificationsController>(
            assignId: true,
            builder: (controller) {
              return HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: ListView.builder(
                  itemCount: controller.data.length,
                  itemBuilder: ((context, index) => CardNotifications(
                      notificationModel: controller.data[index])),
                ),
              );
            },
          ),
        ));
  }
}
