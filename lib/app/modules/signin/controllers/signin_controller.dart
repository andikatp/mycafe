import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SigninController extends GetxController {
  final formKey = GlobalKey<FormState>();
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  RxBool isEnabled = false.obs;

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
