import 'package:http/http.dart' as http;
import 'package:my_app/src/domain/entities/user.dart';
import 'package:my_app/src/domain/repositories/user_repository.dart';

import 'package:my_app/src/core/params/login_request.dart';

class UserRemoteDataSource implements UserRepository {
  final http.Client client;

  UserRemoteDataSource({required this.client});

  @override
  Future<User> login({required String email, required String pass}) {
    // final url = Uri.parse('http://localhost:3000/api/login');
    final request = LoginRequest(email: email, password: pass);
    client.post(request.url, body: request.body);
    return Future.value(User(userId: 1));
  }

}