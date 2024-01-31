// ignore_for_file: avoid_print

import 'package:http/http.dart';

import '../../../core/class/crud.dart';
import '../../../linkapi.dart';

class HomeData {
  Crud crud;

  HomeData(this.crud);

  getData() async {
    const maxRetries = 3;
    for (var i = 0; i < maxRetries; i++) {
      try {
        var response = await crud.postData(AppLink.home, {});
        return response.fold((l) => l, (r) => r);
      } catch (e) {
        await Future.delayed(const Duration(seconds: 1));
        print("Retrying ...$maxRetries");
        if (e is ClientException) {
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
