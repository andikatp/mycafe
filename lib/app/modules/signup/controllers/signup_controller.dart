import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_cafe/app/routes/app_pages.dart';

class SignupController extends GetxController {
  final formKey = GlobalKey<FormState>();
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  RxBool isEnabled = false.obs;
  RxBool isLoading = false.obs;

  void signUpWithEmailAndPassword(String email, String password) async {
    final isValid = formKey.currentState?.validate();
    isLoading.toggle();
    if (isValid!) {
      await Future.delayed(const Duration(milliseconds: 300));
      Get.toNamed(Routes.LENGKAPI, arguments: {
        'email': emailController.text,
        'password': passwordController.text
      });
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
}
