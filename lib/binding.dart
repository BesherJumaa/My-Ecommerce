import 'package:ecommercecourse/controller/auth/login_controller.dart';
import 'package:get/get.dart';

import 'controller/auth/passwordrestore/resetpassword_controller.dart';
import 'controller/auth/signupcontroller.dart';

class Mybinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignUpControllerImp());
    Get.lazyPut(() => LoginControllerImp());
    Get.lazyPut(() => ResetPasswordControllerImp());
    Get.lazyPut(() => SignUpControllerImp());
    // TODO: implement dependencies
  }
}
