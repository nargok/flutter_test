import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:flutter_test/flutter_test.dart';
import 'login_test.mocks.dart';

// todo 後で移動する
abstract class UserRepository {
  login({required String email, required String pass}) {}
}


class Login {
  final UserRepository repository;

  Login({required this.repository});

  call({required String email, required String pass}) {
    repository.login(email: email, pass: pass);
  }
}

@GenerateMocks([UserRepository])
void main() {
  late UserRepository repository;
  late Login useCase;

  setUp(() {
    repository = MockUserRepository();
    useCase = Login(repository: repository);
  });


 group('ログインする', () {
   test('リポジトリのログイン実行', () {
     var email = "test@test.com";
     var pass = "password";
    //  verify(repository.login(email: email, pass: pass));
    //  verify(useCase.call());
    when(repository.login(email: email, pass: pass))
      .thenAnswer((_) => null);
    useCase(email: email, pass: pass);
   });
   test('リポジトリのログイン実行結果を返す', () {});
 }); 
}