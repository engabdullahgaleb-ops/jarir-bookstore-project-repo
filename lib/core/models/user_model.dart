import 'package:flutter/foundation.dart';

class UserModel {
  final String fname;
  final String lname;
  final String email;
  final String phone;
  final String password;

  UserModel({
    required this.fname,
    required this.lname,
    required this.email,
    required this.phone,
    required this.password
  });

  Map<String, dynamic> toJson() => {
    'fname': fname,
    'lname': lname,
    'email': email,
    'phone': phone,
    'password': password
  };

  factory UserModel.fromFirestore(Map<String, dynamic> json) {
    if (kDebugMode) {
      print(json);
    }
    return UserModel(
        fname: json['fname'],
        lname: json['lname'],
        email: json['email'],
        phone: json['phone'],
        password: ''
    );
  }
  String getFullName(){
    return '$fname $lname';
  }
}