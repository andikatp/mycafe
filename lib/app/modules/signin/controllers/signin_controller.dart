import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:my_cafe/app/routes/app_pages.dart';

class SigninController extends GetxController {
  final formKey = GlobalKey<FormState>();
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  RxBool isEnabled = false.obs;

  void goToSignUp() {
    Get.offAllNamed(Routes.SIGNUP);
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
