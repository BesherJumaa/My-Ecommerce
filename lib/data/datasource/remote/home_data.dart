// ignore_for_file: avoid_print

import 'package:ecommercecourse/core/class/status_request.dart';
import 'package:http/http.dart';

import '../../../core/class/crud.dart';
import '../../../linkapi.dart';

class HomeData {
  Crud crud;

  HomeData(this.crud);

  getData() async {
    const maxRetries = 10;
    for (var i = 0; i < maxRetries; i++) {
      try {
        var response = await crud.postData(AppLink.home, {});
        return response.fold((l) => l, (r) => r);
      } catch (e) {
        await Future.delayed(const Duration(seconds: 2));
        print("Retrying ...$maxRetries");
        if (e is ClientException) {
          return StatusRequest.offlineFailure;
          // Handle connection-related exception
          print('Connection closed before full header was received');
        } else {
          // Handle other exceptions
          print('Unexpected error: $e');
        }
      }
    }
    throw Exception('Failed after $maxRetries retries');
  }
}
