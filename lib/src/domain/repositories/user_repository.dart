import 'package:my_app/src/domain/entities/user.dart';
abstract class UserRepository {
  Future<User> login({required String email, required String pass});
}
