import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:flutter_test/flutter_test.dart';
import 'login_test.mocks.dart';

import 'package:my_app/src/domain/repositories/user_repository.dart';
import 'package:my_app/src/domain/usecases/login.dart';
import 'package:my_app/src/domain/entities/user.dart';

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
    when(repository.login(email: email, pass: pass))
      .thenAnswer((_) => null);
    useCase(email: email, pass: pass);
   });
   test('リポジトリのログイン実行結果を返す', () async {
     var email = "test@test.com";
     var pass = "password";
     when(repository.login(email: email, pass: pass))
       .thenAnswer((_) => null);

     final expected = User(userId: 1);
     final actual = await useCase(email: email, pass: pass);

     expect(actual, expected);
   });
 }); 
}
