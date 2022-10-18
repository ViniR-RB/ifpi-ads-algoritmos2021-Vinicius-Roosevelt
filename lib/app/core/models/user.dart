import 'dart:convert';

class User {
  final String id;
  final String name;
  final String password;
  final String email;
  final String token;

  User({
    required this.id,
    required this.name,
    required this.password,
    required this.email,
    required this.token,
  });

   Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'password': password,
      'token': token,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      password: map['password'] ?? '',
      token: map['token'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());
}
