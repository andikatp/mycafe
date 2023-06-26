import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../controllers/loading_controller.dart';

class LoadingView extends GetView<LoadingController> {
  const LoadingView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    );
  }
}
