import 'package:ecommercecourse/core/class/crud.dart';
import 'package:ecommercecourse/linkapi.dart';

class OrdersData {
  Crud crud;

  OrdersData(this.crud);

  getPendingData(String userid) async {
    var response = await crud.postData(AppLink.orderPending, {"id": userid});
    return response.fold((l) => l, (r) => r);
  }

  getArchiveData(String userid) async {
    var response = await crud.postData(AppLink.orderArchive, {"id": userid});
    return response.fold((l) => l, (r) => r);
  }

  rating(String orderID, String rating, String comment) async {
    var response = await crud.postData(
        AppLink.rating, {"id": orderID, "rating": rating, "comment": comment});
    return response.fold((l) => l, (r) => r);
  }

  getDetailsData(String orderid) async {
    var response = await crud.postData(AppLink.orderDetails, {"id": orderid});
    return response.fold((l) => l, (r) => r);
  }

  deleteOrder(String orderid) async {
    var response = await crud.postData(AppLink.orderDelete, {"id": orderid});
    return response.fold((l) => l, (r) => r);
  }
}
