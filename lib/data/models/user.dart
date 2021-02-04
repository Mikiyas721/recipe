import 'package:flutter/material.dart';
import '../../util/abstracts/mappable.dart';

class User extends Mappable {
  final int id;
  final String name;
  final String phoneNumber;
  final String email;
  final String password;

  User(
      {this.id,
      this.name,
      @required this.phoneNumber,
      this.email,
      @required this.password});

  factory User.fromJson(Map map) {
    return User(
      id: map['id'],
      name: map['name'],
      phoneNumber: map['phone_number'],
      email: map['email'],
      password: map['password'],
    );
  }

  @override
  Map toMap() {
    return {
      'id': id,
      'name': name,
      'phone_number': phoneNumber,
      'email': email,
      'password': password,
    };
  }
}
