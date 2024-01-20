import 'package:get/get.dart';

validInput(String val, int min, int max, String type) {
  if (type == "username") {
    if (!GetUtils.isUsername(val)) {
      return "not valid username";
    }
  }
  if (type == "email") {
    if (!GetUtils.isEmail(val)) {
      return "Not Valid Email";
    }
  }
  if (type == "phone") {
    if (!GetUtils.isPhoneNumber(val)) {
      return "not valid Phone Number";
    }
  }
  if (val.length < min) {
    return "value cant be less than $min";
  }

  if (val.length > max) {
    return "value cant be less than $max";
  }
  if (val.isEmpty) {
    return " cant be Empty";
  }
}
