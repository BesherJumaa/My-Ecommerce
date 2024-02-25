import 'package:get/get.dart';

import '../controller/search_controller.dart';
import '../core/class/crud.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(Crud());
    Get.put(SearchMixController());
  }
}
