import 'package:ecommercecourse/core/class/status_request.dart';
import 'package:ecommercecourse/core/functions/handling_data_controller.dart';
import 'package:ecommercecourse/core/services/services.dart';
import 'package:ecommercecourse/data/model/notification_model.dart';
import 'package:get/get.dart';
import '../data/datasource/remote/notification_data.dart';

class NotificationsController extends GetxController {
  NotificationData notificationData = NotificationData(Get.find());
  MyServices myServices = Get.find();
  List<NotificationModel> data = [];
  late StatusRequest statusRequest;
  getData() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await notificationData
        .getData(myServices.sharedPreferences.getString("id")!);
    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        List dataList = response['data'];
        data.addAll(dataList.map((e) => NotificationModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    super.onInit();
    getData();
  }
}
