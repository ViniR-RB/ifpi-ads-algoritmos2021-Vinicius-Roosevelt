import 'package:app/app/modules/auth/auth_repository.dart';
import 'package:app/app/modules/auth/pages/signin/signi_repository.dart';

class SignInController {
  final SignInRepository repository;

  SignInController({required this.repository});

  signIn(name, email, password) async {
    final exists = await repository.signIn(email, password);
  }
}
