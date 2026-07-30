import 'package:flutter/material.dart';
import 'package:jarir_bookstore_project/core/presentation/screens/main_screen.dart';
import 'package:jarir_bookstore_project/shared/helpers/helpers.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    pause(Duration(seconds: 5)).then(
      (v) => Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MainScreen()),
      ),
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
