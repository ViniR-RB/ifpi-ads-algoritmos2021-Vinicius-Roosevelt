import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';

class AuthRepository {
  Dio repository = Dio();
  var url = 'http://172.17.0.1:3000/auth/login';
  login(email, password) async {
    try {
      final Map<String, dynamic> login = {
        'email': email,
        'password': password,
      };
      var response = await repository.post(url,
          data: jsonEncode(login),
          options: Options(headers: {
            HttpHeaders.contentTypeHeader: 'application/json',
          }));
      print('Response: $response');
      return response;
    } catch (e) {
      print('Error: $e');
      return 400;
    }
  }
}
