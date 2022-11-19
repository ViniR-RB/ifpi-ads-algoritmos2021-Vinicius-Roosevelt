import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';

class PeopleFormRepository {
  Dio repository = Dio();
  signInPeople(Map<String, dynamic> user) async {
    try {
      final String url = 'http://172.17.0.1:3000/auth/signup/employee';
      final Response<dynamic> response = await repository.post(url,
          data: jsonEncode(user),
          options: Options(headers: {
            HttpHeaders.contentTypeHeader: 'application/json',
          }));
      print('Response:  $response');
      return response;
    } catch (e) {
      throw Exception('Email ou senha inválidos tente novamente');
    }
  }
}
