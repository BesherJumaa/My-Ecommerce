import 'package:ecommercecourse/core/constant/routes.dart';

import 'package:get/get.dart';

abstract class SuccessSignUpController extends GetxController {
  goToLogin();
}

class SuccessSignUpControllerImp extends SuccessSignUpController {
  @override
  goToLogin() {
    Get.offAllNamed(AppRoutes.login);
    // TODO: implement toSignUp
    throw UnimplementedError();
  }
}
