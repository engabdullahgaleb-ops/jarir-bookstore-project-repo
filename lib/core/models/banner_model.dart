import 'package:flutter/foundation.dart';

class BannerModel {
  final String imageUrl;
  final int order;

  const BannerModel({required this.imageUrl, required this.order});

  factory BannerModel.fromFirestore(Map<String, dynamic> json) {
    if (kDebugMode) {
      print(json);
    }
    return BannerModel(order: json['order'], imageUrl: json['imageUrl']);
  }
}
