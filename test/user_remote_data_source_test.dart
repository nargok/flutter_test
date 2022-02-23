import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'user_remote_data_source_test.mocks.dart';
import 'package:my_app/src/data/datasource/remote/user_remote_data_source.dart';
import 'package:my_app/src/core/params/login_request.dart';

@GenerateMocks([http.Client])
void main() {
  late http.Client client;
  late UserRemoteDataSource remoteDataSource;

  setUp(() {
    client = MockClient();
    remoteDataSource = UserRemoteDataSource(client: client);    
  });

  group('ログインAPI', () {
    test('HTTPクライアントでPOST', () {
      const email = "test@example.com";
      const password = "password";
      final request = LoginRequest(email: email, password: password);
      when(client.post(request.url, body: request.body))
        .thenAnswer((realInvocation) async => http.Response("{{\"user_id\": 1}}", 200));

      remoteDataSource.login(email: 'test@example.com', pass: 'password');
      verify(client.post(request.url, body: request.body));
    });
    test('HTTPクライアントのレスポンスをモデルへ変換し返す', () {});
  });
}