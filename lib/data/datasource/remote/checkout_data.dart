// ignore_for_file: avoid_print

import 'package:http/http.dart';

import '../../../core/class/crud.dart';
import '../../../core/class/status_request.dart';
import '../../../linkapi.dart';

class CheckOutData {
  Crud crud;

  CheckOutData(this.crud);

  checkout(Map data) async {
    const maxRetries = 3;
    for (var i = 0; i < maxRetries; i++) {
      try {
        var response = await crud.postData(AppLink.ordersCheckout, data);
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
    // throw Exception('Failed after $maxRetries retries');
  }
}
