import 'dart:convert';

class RegisterRequest {
  String email;
  String password;
  String fullName;

  RegisterRequest({
    required this.email,
    required this.password,
    required this.fullName,
  });

  factory RegisterRequest.fromRawJson(String str) =>
      RegisterRequest.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory RegisterRequest.fromJson(Map<String, dynamic> json) =>
      RegisterRequest(
        email: json["email"],
        password: json["password"],
        fullName: json["full_name"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
        "full_name": fullName,
      };
}
