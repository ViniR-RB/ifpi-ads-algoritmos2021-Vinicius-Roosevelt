import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';

class AuthRepository {
  Dio repository = Dio();
  var url = 'http://172.17.0.1:3000/auth/login';
  login(Map<String, dynamic> user) async {
    try {
      final Response<dynamic> response = await repository.post(url,
          data: jsonEncode(user),
          options: Options(headers: {
            HttpHeaders.contentTypeHeader: 'application/json',
          }));

      return response;
    } catch (e) {
      throw 'Usuario ou Senha Incorreto';
    }
  }
}
