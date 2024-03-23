import 'package:ecommercecourse/core/constant/color.dart';
import 'package:ecommercecourse/data/model/notification_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

import '../../../controller/orders/order_pending_controller.dart';

class CardNotifications extends GetView<OrdersPendingController> {
  final NotificationModel notificationModel;
  const CardNotifications({Key? key, required this.notificationModel})
      : super(key: key);

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
                    notificationModel.notificationTitle!,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                  const Spacer(),
                  // Text(listdata.ordersDatetime!)
                  Text(
                    Jiffy(notificationModel.notificationDate!, "yyyy-MM-dd")
                        .fromNow(),
                    style: const TextStyle(
                        color: AppColor.primaryColor,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
              const Divider(),
              const Divider(),
              Text(
                notificationModel.notificationBody!,
                style: const TextStyle(fontSize: 20),
              ),
            ],
          )),
    );
  }
}
