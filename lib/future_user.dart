import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FutureUser {
  final String name;

  final String email;
  FutureUser({
    required this.name,
    required this.email,
  });

  FutureUser copyWith({
    String? name,
    String? email,
  }) {
    return FutureUser(
      name: name ?? this.name,
      email: email ?? this.email,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'email': email,
    };
  }

  factory FutureUser.fromMap(Map<String, dynamic> map) {
    return FutureUser(
      name: map['name'] as String,
      email: map['email'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory FutureUser.fromJson(String source) =>
      FutureUser.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'FutureUser(name: $name, email: $email)';

  @override
  bool operator ==(covariant FutureUser other) {
    if (identical(this, other)) return true;

    return other.name == name && other.email == email;
  }

  @override
  int get hashCode => name.hashCode ^ email.hashCode;
}

final userRepositoryProvider = Provider((ref) => UserRepository());

class UserRepository {
  Future<FutureUser> fetchUserData(String input) {
    String url = "https://jsonplaceholder.typicode.com/users/$input";
    var dio = Dio();
    return dio.get(url).then((value) {
      return FutureUser.fromJson(value.data);
    });
  }
}
