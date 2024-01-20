import 'package:get/get.dart';

abstract class ItemsController extends GetxController {
  initialData();
  changeCat(int val);
  changeFavorite(bool val);
}

class ItemsControllerImp extends ItemsController {
  List categories = [];
  int? selectedCat;
  bool favorite = false;
  @override
  initialData() {
    categories = Get.arguments['categories'];
    selectedCat = Get.arguments['selectedcat'];
  }

  @override
  void onInit() {
    // TODO: implement onInit
    initialData();
    super.onInit();
  }

  @override
  changeCat(val) {
    selectedCat = val;
    update();
  }

  @override
  changeFavorite(bool val) {
    val = !val;
    favorite = val;
    print(favorite);
    update();
  }
}
