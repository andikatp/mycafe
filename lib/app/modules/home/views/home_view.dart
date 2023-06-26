import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:my_cafe/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () async {
                await FirebaseAuth.instance
                    .signOut()
                    .then((value) => Get.offAndToNamed(Routes.SIGNIN));
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      body: const Center(
        child: Text(
          'HomeView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
