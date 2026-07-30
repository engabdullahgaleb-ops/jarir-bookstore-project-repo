import 'package:flutter/foundation.dart';

class BrandModel {
  final Map<String, dynamic> title;
  final String imageUrl;

  BrandModel({required this.title, required this.imageUrl});

  factory BrandModel.fromFirestore(Map<String, dynamic> json) {
    if (kDebugMode) {
      print(json);
    }
    return BrandModel(title: json['title'], imageUrl: json['imageUrl']);
  }
}
