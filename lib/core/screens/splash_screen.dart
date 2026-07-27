import 'package:flutter/material.dart';
import 'package:jarir_bookstore_project/core/Screens/home_screen.dart';
import 'package:jarir_bookstore_project/shared/helpers/helpers.dart';

class SplashScreen extends StatelessWidget{
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    pause(Duration(seconds: 5)).then((v)=>
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomeScreen()
      ))
    );
    return Scaffold(
      body: Center(
        child: Image(
          image: AssetImage('assets/images/splash_screen_image.png'),
        ),
      ),
    );

  }

}