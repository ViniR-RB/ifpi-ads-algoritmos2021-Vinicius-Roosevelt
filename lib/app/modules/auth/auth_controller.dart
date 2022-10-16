import 'package:app/app/modules/auth/auth_repository.dart';

class AuthController {
  final AuthRepository repository;

  AuthController({required this.repository});

  login(name, email, password) async {
    final exists = await repository.login(name, email, password);

    if (exists == 409) {
      return true;
    } else {
      return false;
    }
  }
}
