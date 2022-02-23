import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:flutter_test/flutter_test.dart';
import 'login_test.mocks.dart';

import 'package:my_app/src/domain/repositories/user_repository.dart';
import 'package:my_app/src/domain/usecases/login.dart';

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