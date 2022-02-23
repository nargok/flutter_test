import 'package:my_app/src/domain/repositories/user_repository.dart';

class Login {
  final UserRepository repository;

  Login({required this.repository});

  call({required String email, required String pass}) {
    repository.login(email: email, pass: pass);
  }
}