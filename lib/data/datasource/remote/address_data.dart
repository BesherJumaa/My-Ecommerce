// ignore_for_file: avoid_print

import 'package:http/http.dart';

import '../../../core/class/crud.dart';
import '../../../core/class/status_request.dart';
import '../../../linkapi.dart';

class AddressData {
  Crud crud;
  AddressData(this.crud);

  addAddress(
    String userID,
    String name,
    String city,
    String governorate,
    String country,
    String street,
    String lat,
    String long,
  ) async {
    var response = await crud.postData(AppLink.addressAdd, {
      "usersid": userID,
      "name": name,
      "city": city,
      "governorate": governorate,
      "country": country,
      "street": street,
      "lat": lat,
      "long": long,
    });
    return response.fold((l) => l, (r) => r);
  }

  deleteAddress(
    String addressID,
  ) async {
    var response = await crud.postData(AppLink.addressDelete, {
      "addressid": addressID,
    });
    return response.fold((l) => l, (r) => r);
  }

  editAddress(
    var addressId,
    String name,
    String city,
    String governorate,
    String country,
    String street,
  ) async {
    var response = await crud.postData(AppLink.addressEdit, {
      "addressid": addressId,
      "name": name,
      "city": city,
      "governorate": governorate,
      "country": country,
      "street": street,
    });
    return response.fold((l) => l, (r) => r);
  }

  getDataByAddressID(String id) async {
    const maxRetries = 3;
    for (var i = 0; i < maxRetries; i++) {
      try {
        var response = await crud
            .postData(AppLink.addressViewById, {"addressid": id.toString()});
        if (response is String) {
          // Check if the response is a string (HTML or unexpected format)
          print('Unexpected response: $response');
          return StatusRequest.failure;
        }
        return response.fold((l) => l, (r) => r);
      } catch (e) {
        await Future.delayed(const Duration(seconds: 1));
        print("Retrying ...$maxRetries");
        if (e is ClientException) {
          return StatusRequest.offlineFailure;
        } else {
          // Handle other exceptions
          print('Unexpected error: $e');
        }
      }
    }
    throw Exception('Failed after $maxRetries retries');
  }

  getData(String id) async {
    const maxRetries = 3;
    for (var i = 0; i < maxRetries; i++) {
      try {
        var response = await crud
            .postData(AppLink.addressView, {"usersid": id.toString()});
        if (response is String) {
          // Check if the response is a string (HTML or unexpected format)
          print('Unexpected response: $response');
          return StatusRequest.failure;
        }
        return response.fold((l) => l, (r) => r);
      } catch (e) {
        await Future.delayed(const Duration(seconds: 1));
        print("Retrying ...$maxRetries");
        if (e is ClientException) {
          return StatusRequest.offlineFailure;
        } else {
          // Handle other exceptions
          print('Unexpected error: $e');
        }
      }
    }
    throw Exception('Failed after $maxRetries retries');
  }
}
