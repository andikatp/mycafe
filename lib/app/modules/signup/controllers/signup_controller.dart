import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_cafe/app/routes/app_pages.dart';

class SignupController extends GetxController {
  final formKey = GlobalKey<FormState>();
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  final firestore = FirebaseFirestore.instance;
  RxBool checkUser = false.obs;
  RxBool isEnabled = false.obs;
  RxBool isLoading = false.obs;

  void signUpWithEmailAndPassword(String email, String password) async {
    final isValid = formKey.currentState?.validate();
    isLoading.toggle();
    final CollectionReference usersCollection =
        FirebaseFirestore.instance.collection('users');
    final DocumentSnapshot userWithTheSameEmail =
        await usersCollection.doc(email).get();
    if (isValid!) {
      if (userWithTheSameEmail.exists) {
        Get.offAllNamed(Routes.SIGNIN, arguments: email);
      } else {
        Get.toNamed(Routes.LENGKAPI, arguments: {
          'email': emailController.text,
          'password': passwordController.text
        });
      }
    }
    isLoading.toggle();
  }

  @override
  void onInit() {
    emailController = TextEditingController()
      ..addListener(() {
        if (emailController.text.isNotEmpty &&
            passwordController.text.isNotEmpty) {
          isEnabled.value = true;
        } else {
          isEnabled.value = false;
        }
      });
    passwordController = TextEditingController()
      ..addListener(() {
        if (emailController.text.isNotEmpty &&
            passwordController.text.isNotEmpty) {
          isEnabled.value = true;
        } else {
          isEnabled.value = false;
        }
      });
    super.onInit();
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
