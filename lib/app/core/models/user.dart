import 'dart:convert';

class User {
  final String id;
  final String name;
  final String password;
  final String email;
  final String token;
  final String avatar;

  User(
    this.id,
    this.name,
    this.token,
    this.avatar, {
    required this.password,
    required this.email,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'token': token,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      map['user']['id'] ?? '',
      map['user']['name'] ?? '',
      map['token'] ?? '',
      map['avatar'] ??
          'https://img.freepik.com/free-icon/important-person_318-10744.jpg?t=st=1645538552~exp=1645539152~hmac=268f4df1741112ca3b8735a233c8d50b8c76ebe5b0aa4d7bf90f1a359824ed8d&w=996',
      email: map['user']['email'] ?? '',
      password: map['user']['password'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());
}
