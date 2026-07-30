import 'package:flutter/foundation.dart';

class AssetsModel {
  final String banner;

  const AssetsModel({required this.banner});

  factory AssetsModel.fromFirestore(Map<String, dynamic> json) {
    if (kDebugMode) {
      print(json);
    }
    return AssetsModel(banner: json['banner']);
  }
}
