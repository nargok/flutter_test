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
   const email = "test@test.com";
   const pass = "password";
   final expected = Future<User>.value(User(userId: 1));

   test('リポジトリのログイン実行', () {
    when(repository.login(email: email, pass: pass))
      .thenAnswer((_) => expected);
    useCase(email: email, pass: pass);
   });
   test('リポジトリのログイン実行結果を返す', () {
     when(repository.login(email: email, pass: pass))
       .thenAnswer((_) => expected);

     final actual = useCase(email: email, pass: pass);

     expect(actual, expected);
   });
 }); 
}
