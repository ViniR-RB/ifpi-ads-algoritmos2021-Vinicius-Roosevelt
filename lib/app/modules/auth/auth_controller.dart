import 'package:app/app/core/db/db.dart';
import 'package:app/app/core/models/user.dart';
import 'package:app/app/modules/auth/auth_repository.dart';
import 'package:dio/dio.dart';

class AuthController {
  final AuthRepository repository;

  AuthController({required this.repository});

  login(Map<String, dynamic> user) async {
    try {
      final Response<dynamic> response = await repository.login(user);

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
      print(e);
      if (e.toString() == 'Usuario ou Senha Incorreto') {
        return true;
      }
    }
  }
}
