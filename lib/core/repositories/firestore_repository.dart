import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:jarir_bookstore_project/core/models/assets_model.dart';
import 'package:jarir_bookstore_project/core/models/banner_model.dart';
import 'package:jarir_bookstore_project/core/models/brand_model.dart';
import 'package:jarir_bookstore_project/core/models/category_model.dart';
import 'package:jarir_bookstore_project/core/models/user_model.dart';

class FirestoreRepository {
  FirestoreRepository();

  Future<List<CategoryModel>> getCategories() async {
    final snapshot = await FirebaseFirestore.instance
        .collection('categories')
        .get();

    return snapshot.docs.map((doc) {
      return CategoryModel.fromFirestore(doc.id, doc.data());
    }).toList();
  }

  Future<List<BannerModel>> getBanners() async {
    final snapshot = await FirebaseFirestore.instance
        .collection('banners')
        .orderBy("order")
        .get();

    return snapshot.docs
        .map((e) => BannerModel.fromFirestore(e.data()))
        .toList();
  }

  Future<List<AssetsModel>> getAssets() async {
    final snapshot = await FirebaseFirestore.instance
        .collection('assets')
        .get();

    return snapshot.docs
        .map((e) => AssetsModel.fromFirestore(e.data()))
        .toList();
  }

  Future<List<BrandModel>> getBrands() async {
    final snapshot = await FirebaseFirestore.instance
        .collection('brands')
        .get();

    return snapshot.docs
        .map((e) => BrandModel.fromFirestore(e.data()))
        .toList();
  }

  Future<void> registerNewUser (Map<String,dynamic> data,String uid) async {
    return await FirebaseFirestore.instance.collection('users').doc(uid).set(data);
  }

  Future<UserModel?> getUserData(String uid) async {
    final doc = await FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .get();

    if (!doc.exists) return null;

    return UserModel.fromFirestore(doc.data()!);
  }
}
