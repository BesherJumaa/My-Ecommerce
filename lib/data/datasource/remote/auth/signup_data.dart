import '../../../../core/class/crud.dart';
import '../../../../linkapi.dart';

class SignupData {
  Crud crud;
  SignupData(this.crud);

  postData(String username, String email, String password, phone) async {
    var response = await crud.postData(AppLink.signUp, {
      "username": username,
      "email": email,
      "password": password,
      "phone": phone,
    });
    return response.fold((l) => l, (r) => r);
  }
}
