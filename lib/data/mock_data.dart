import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jarir_bookstore_project/core/cubits/locale_cubit.dart';

class MockData{
  static String getLocation (BuildContext context) {
    return  context.read<LocaleCubit>().isArabic()?"الجامعة تاون سكوير - جده":"University Town Square - Jeddah";
  }
}