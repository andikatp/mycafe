import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_cafe/app/routes/app_pages.dart';

class SigninController extends GetxController {
  final formKey = GlobalKey<FormState>();
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  final auth = FirebaseAuth.instance;
  RxBool isEnabled = false.obs;
  RxBool isLoading = false.obs;

  void signIn() async {
    try {
      isLoading.toggle();
      bool? isValidate = formKey.currentState?.validate();
      if (isValidate!) {
        await auth.signInWithEmailAndPassword(
            email: emailController.text, password: passwordController.text);
      }
      isLoading.toggle();
    } on FirebaseAuthException catch (e) {
      Get.snackbar(
        'Error',
        e.message ?? 'No Messages',
        backgroundColor: Colors.grey.shade300,
        borderWidth: 0.2,
        duration: const Duration(seconds: 2),
      );
      isLoading.toggle();
    } on FirebaseException catch (e) {
      Get.snackbar(
        'Error',
        e.message ?? 'No Messages',
        backgroundColor: Colors.grey.shade300,
        borderWidth: 0.2,
        duration: const Duration(seconds: 2),
      );
      isLoading.toggle();
    } catch (e) {
      Get.snackbar(
        'Error',
        'Terjadi kesalahan!, silahkan coba lagi nanti',
        backgroundColor: Colors.grey.shade300,
        borderWidth: 0.2,
        duration: const Duration(seconds: 2),
      );
      isLoading.toggle();
    }
  }

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
