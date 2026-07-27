

import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:jarir_bookstore_project/shared/helpers/bloc_observer_helper.dart';
import 'package:jarir_bookstore_project/shared/helpers/shared_preferences_helper.dart';

import 'core/Screens/app.dart';

void main() async{
  //init
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = BlocObserverHelper();
  Firebase.initializeApp();
  await SharedPreferencesHelper.instance.init();

  //run
  runApp(const App());
}

