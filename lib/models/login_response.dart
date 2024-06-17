class LoginResponse {
  final String status;
  final String token;
  final int expiresAt;

  LoginResponse(
      {required this.status, required this.token, required this.expiresAt});

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
        status: json['status'],
        token: json['data']['token'],
        expiresAt: json['data']['expiresAt']);
  }
}
