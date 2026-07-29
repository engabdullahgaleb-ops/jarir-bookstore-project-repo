import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jarir_bookstore_project/core/models/assets_model.dart';
import 'package:jarir_bookstore_project/core/models/banner_model.dart';
import 'package:jarir_bookstore_project/core/models/brand_model.dart';
import 'package:jarir_bookstore_project/core/models/category_model.dart';
import 'package:jarir_bookstore_project/core/repositories/firestore_repository.dart';

//state
sealed class RemoteDataState {}

final class RemoteDataInitial extends RemoteDataState {}

final class RemoteDataLoading extends RemoteDataState {}

final class RemoteDataLoaded extends RemoteDataState {
  final List<BannerModel> banners;
  final List<CategoryModel> categories;
  final List<AssetsModel> assets;
  final List<BrandModel> brands;

  RemoteDataLoaded({
    required this.banners,
    required this.categories,
    required this.assets,
    required this.brands
  });
}

final class RemoteDataError extends RemoteDataState {
  final String message;

  RemoteDataError(this.message);
}


//cubit
class RemoteDataCubit extends Cubit<RemoteDataState> {
  final FirestoreRepository repository;

  RemoteDataCubit({
    required this.repository,
  }) : super(RemoteDataInitial());

  Future<void> loadData() async {
    emit(RemoteDataLoading());
      await Future.wait([
        repository.getBanners(),
        repository.getCategories(),
        repository.getAssets(),
        repository.getBrands()
      ]).then((result){
        emit(
          RemoteDataLoaded(
            banners: result[0] as List<BannerModel>,
            categories: result[1] as List<CategoryModel>,
            assets: result[2] as List<AssetsModel>,
            brands: result[3] as List<BrandModel>
          ),
        );
      }).catchError((error){
        if (kDebugMode) {
          print(error);
        }
        emit(RemoteDataError(error.toString()));
        throw error;
      });






  }

  Future<void> refresh() async {
    await loadData();
  }
}