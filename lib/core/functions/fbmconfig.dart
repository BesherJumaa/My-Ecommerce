import 'package:ecommercecourse/controller/orders/order_pending_controller.dart';
import 'package:ecommercecourse/core/constant/routes.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
// import 'package:vibration/vibration.dart';

requestPermissionNotifications() async {
  NotificationSettings settings = await FirebaseMessaging.instance
      .requestPermission(
          provisional: true, sound: true, alert: true, badge: true);
  return settings;
}

fbmConfig() {
  FirebaseMessaging.onMessage.listen((message) async {
    // FlutterRingtonePlayer.playNotification();
    Get.snackbar(message.notification!.title!, message.notification!.body!);
    // if (await Vibration.hasVibrator() == true) {
    //   Vibration.vibrate();
    // }
    refreshPageNotification(message.data);
    if (kDebugMode) {
      print("=======Notification=========");
      print(message.notification!.title);
      print(message.notification!.body);
    }
  });
}

void refreshPageNotification(Map<String, dynamic> data) {
  if (kDebugMode) {
    print("=======Page ID=========");
    print(data['pageid']);
    print("=======Page Name=========");
    print(data['pagename']);
  }
  if (Get.currentRoute == AppRoutes.ordersPending &&
      data['pagename'] == "refreshorderpending") {
    OrdersPendingController controller = Get.find();
    controller.getData();
  }
}
