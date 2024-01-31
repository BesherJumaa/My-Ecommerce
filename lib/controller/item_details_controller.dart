import 'package:ecommercecourse/data/model/items_model.dart';
import 'package:get/get.dart';

abstract class ItemDetailsController extends GetxController {}

class ItemDetailsControllerImp extends ItemDetailsController {
  late ItemsModel itemsModel;
  // late MyFavoriteModel itemsModels;
  initialData() {
    itemsModel = Get.arguments['itemsModel'];
    // itemsModels = Get.arguments['itemsModel'];
  }

  List subItems = [
    {"name": "red", "id": 1, "active": false},
    {"name": "yellow", "id": 2, "active": true},
    {"name": "black", "id": 3, "active": true},
  ];

  @override
  void onInit() {
    initialData();
    super.onInit();
  }
}
