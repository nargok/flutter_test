import 'package:my_app/src/domain/entities/user.dart';
import 'package:my_app/src/domain/repositories/user_repository.dart';

class Login {
  final UserRepository repository;

  Login({required this.repository});

  Future<User> call({required String email, required String pass}) {
    return repository.login(email: email, pass: pass);
  }
}