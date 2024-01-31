import '../../../core/class/crud.dart';
import '../../../linkapi.dart';

class FavoriteData {
  Crud crud;
  FavoriteData(this.crud);

  addFavorite(
    String itemID,
    String userID,
  ) async {
    var response = await crud.postData(AppLink.favoriteAdd, {
      "itemsid": itemID,
      "usersid": userID,
    });
    return response.fold((l) => l, (r) => r);
  }

  removeFavorite(
    String itemID,
    String userID,
  ) async {
    var response = await crud.postData(AppLink.favoriteRemove, {
      "itemsid": itemID,
      "usersid": userID,
    });
    return response.fold((l) => l, (r) => r);
  }
}
