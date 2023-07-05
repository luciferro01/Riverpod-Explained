// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class User {
  final String name;
  final int age;
  User({
    required this.name,
    required this.age,
  });

  User copyWith({
    String? name,
    int? age,
  }) {
    return User(
      name: name ?? this.name,
      age: age ?? this.age,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'age': age,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      name: map['name'] as String,
      age: map['age'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'User(name: $name, age: $age)';

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;

    return other.name == name && other.age == age;
  }

  @override
  int get hashCode => name.hashCode ^ age.hashCode;
}

class UserNotifer extends StateNotifier<User> {
  // UserNotifer(super.state);
  UserNotifer() : super(User(age: 10, name: "MOHIL BANSAL"));

  void updateName(String nameValue) {
    // state = User(name: nameValue, age: 10);
    state = state.copyWith(name: nameValue);
  }

  void updateAge(String ageValue) {
    // state = User(name: nameValue, age: 10);
    state = state.copyWith(age: int.parse(ageValue));
  }
}

//Change Notifier (It is an imposter here) (It is immutable😅😅😅🥲)
class UserChangeNotifier extends ChangeNotifier {
  User user = User(name: 'MOHIL BANSAL', age: 19);

  void updateName(String nameValue) {
    user = user.copyWith(name: nameValue);
    notifyListeners();
  }

  void updateAge(String ageValue) {
    user = user.copyWith(age: int.parse(ageValue));
    notifyListeners();
  }
}
