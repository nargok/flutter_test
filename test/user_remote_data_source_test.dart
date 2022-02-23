import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';

import 'user_remote_data_source_test.mocks.dart';

import 'package:my_app/src/data/datasource/remote/user_remote_data_source.dart';

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
      final url = Uri.parse('http://localhost:3000/api/login');
      final body = {'email': 'test@example.com', 'password': 'password1'};
      when(client.post(url, body: body))
        .thenAnswer((realInvocation) async => http.Response("{{\"user_id\": 1}}", 200));

      remoteDataSource.login(email: 'test@example.com', pass: 'password');
      verify(client.post(url, body: body));
    });
    test('HTTPクライアントのレスポンスをモデルへ変換し返す', () {});
  });
}