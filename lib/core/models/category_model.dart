import 'package:flutter/foundation.dart';

class CategoryModel {
  final String imageUrl;
  final int order;
  final Map<String, String> title;

  const CategoryModel({
    required this.imageUrl,
    required this.order,
    required this.title,
  });

  factory CategoryModel.fromFirestore(
      String id,
      Map<String, dynamic> json,
      ) {
    return CategoryModel(
      imageUrl: json['imageUrl'],
      order: json['order'],
      title: Map<String, String>.from(json['title']),
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'imageUrl': imageUrl,
      'order': order,
      'title': title,
    };
  }

  String getTitle(String languageCode) {
    return title[languageCode] ?? title['en'] ?? '';
  }
}