import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
            child: Stack(
          alignment: Alignment.center,
          children: [
            Lottie.asset(
              'assets/logo/bglogo.json',
              height: 150,
              width: 150,
            ),
            Image.asset(
              'assets/images/logo.png',
              height: 90,
              width: 90,
            ),
          ],
        )),
      ),
    );
  }
}
