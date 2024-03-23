import '../../../../../../core/class/crud.dart';
import '../../../../../../linkapi.dart';

class NotificationData {
  Crud crud;
  NotificationData(this.crud);

  getData(String userID) async {
    var response = await crud.postData(AppLink.notification, {"id": userID});
    return response.fold((l) => l, (r) => r);
  }
}
