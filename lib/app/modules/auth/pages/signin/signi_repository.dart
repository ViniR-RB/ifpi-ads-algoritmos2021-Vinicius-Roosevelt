import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';

class SignInRepository {
  Dio repository = Dio();
  var url = 'http://172.17.0.1:3000/auth/login';
  signIn(email, password) async {
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
      return response.statusCode;
    } catch (e) {
      print(e);
    }
  }
}
