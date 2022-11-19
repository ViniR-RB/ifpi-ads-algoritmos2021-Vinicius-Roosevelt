import 'package:dio/dio.dart';

import '../../../../../../core/db/db.dart';
import '../../../../../../core/models/user.dart';
import 'factoryForm_repository.dart';

class FactoryFormController {
  final FactoryFormRepository repository;

  FactoryFormController({required this.repository});

  signInFactory(Map<String, dynamic> user) async {
    try {
      final Response<dynamic> response = await repository.signInFactory(user);
      final DatabaseConnect db = DatabaseConnect();
      final Map<String, dynamic> userData = response.data;
      final User users = User.fromMap(userData);
      final List<User> userList = await db.getUser();

      if (userList.isEmpty) {
        await db.insertUser(users);
      } else {
        if (users.id != userList[0].id) {
          await db.deleteToken(userList[0].id);
          await db.insertUser(users);
        } else {
          await db.deleteToken(users.id);
          await db.insertUser(users);
        }
      }
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }
}
