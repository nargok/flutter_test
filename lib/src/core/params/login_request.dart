class LoginRequest {
  final Uri url = Uri.parse("http://localhost:3000/api/login");
  final String email;
  final String password;

  LoginRequest({
    required this.email,
    required this.password
  });

  Map<String, dynamic> get body {
    return {'email': email, 'password': password};
  }
}