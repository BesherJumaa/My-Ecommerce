import 'package:cool_alert/cool_alert.dart';
import 'package:ecommercecourse/core/class/StatusRequest.dart';
import 'package:ecommercecourse/core/constant/routes.dart';
import 'package:ecommercecourse/data/datasource/remote/forgetpassword/verifycodepassword_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../core/constant/color.dart';
import '../../../core/functions/handlingdatacontroller.dart';
import '../../../view/widgets/auth/custombuttonauth.dart';

abstract class VerifyCodeController extends GetxController {
  checkCode();
  goToResetPassword(String verifyCode);
}

class VerifyCodeControllerImp extends VerifyCodeController {
  VerifyCodeData verifyCodeData = VerifyCodeData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  String? email;
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  @override
  checkCode() {}

  @override
  goToResetPassword(String verifyCode) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await verifyCodeData.postdata(email!, verifyCode);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.offNamed(AppRoutes.resetPassword, arguments: {"email": email});
      } else {
        CoolAlert.show(
            context: Get.overlayContext!,
            type: CoolAlertType.warning,
            text: "Verify Code Not Correct",
            confirmBtnText: "Try Again",
            confirmBtnColor: AppColor.primaryColor,
            onConfirmBtnTap: () {
              statusRequest = StatusRequest.failure;
              // update();
            });

        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    email = Get.arguments['email'];
    super.onInit();
  }
}
