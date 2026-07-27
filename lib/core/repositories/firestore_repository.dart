import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:jarir_bookstore_project/core/models/banner_model.dart';
import 'package:jarir_bookstore_project/core/models/category_model.dart';

class FirestoreRepository {

   FirestoreRepository();
   Future<List<CategoryModel>> getCategories() async {
    final snapshot = await FirebaseFirestore.instance
        .collection('categories')
        .get();

    return snapshot.docs.map((doc) {
      return CategoryModel.fromFirestore(
        doc.id,
        doc.data(),
      );
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
}