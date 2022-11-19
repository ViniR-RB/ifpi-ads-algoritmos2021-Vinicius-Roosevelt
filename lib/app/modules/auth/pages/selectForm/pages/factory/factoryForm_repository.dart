import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';

class FactoryFormRepository {
  Dio repository = Dio();
  signInFactory(Map<String, dynamic> user) async {
    try {
      const String url = 'http://172.17.0.1:3000/auth/signup/enterprise';
      final Response<dynamic> response = await repository.post(url,
          data: jsonEncode(user),
          options: Options(headers: {
            HttpHeaders.contentTypeHeader: 'application/json',
          }));
      print('Response:  $response');
      return response;
    } catch (e) {
      throw Exception('Email ou senha invaĺido');
    }
  }
}
