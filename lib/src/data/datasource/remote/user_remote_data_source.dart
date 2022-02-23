import 'package:http/http.dart' as http;
import 'package:my_app/src/domain/entities/user.dart';
import 'package:my_app/src/domain/repositories/user_repository.dart';


class UserRemoteDataSource implements UserRepository {
  final http.Client client;

  UserRemoteDataSource({required this.client});

  @override
  Future<User> login({required String email, required String pass}) {
    final url = Uri.parse('http://localhost:3000/api/login');
    client.post(url, body: {'email': 'test@example.com', 'password': 'password1'});
    return Future.value(User(userId: 1));
  }

}