import 'package:app/app/modules/auth/auth_repository.dart';

class AuthController {
  final AuthRepository repository;

  AuthController({required this.repository});

  login(email, password) async {
    final exists = await repository.login(email, password);

    if (exists == 400) {
      return false;
    } else {
      return true;
    }
    
  }
}
