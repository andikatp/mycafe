import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_cafe/app/routes/app_pages.dart';

class LupaPasswordController extends GetxController {
  late final TextEditingController emailController;
  final isEnabled = false.obs;

  void pergiKeLupaPasswordEmail() {
    Get.toNamed(Routes.LUPA_PASSWORD_EMAIL,
        arguments: emailController.text.trim());
  }

  @override
  void onInit() {
    emailController = TextEditingController()
      ..addListener(() {
        if (emailController.text.isNotEmpty &&
            (emailController.text.contains('@') &&
                emailController.text.contains('.'))) {
          isEnabled.value = true;
        } else {
          isEnabled.value = false;
        }
      });
    super.onInit();
  }
}
