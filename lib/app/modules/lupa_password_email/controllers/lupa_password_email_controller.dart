import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_cafe/app/routes/app_pages.dart';

class LupaPasswordEmailController extends GetxController {
  String email = '';
  RxBool isButtonEnabled = true.obs;
  final remainingTime = 0.obs;
  final auth = FirebaseAuth.instance;

  void pergiKeLogin() {
    Get.offAllNamed(Routes.SIGNIN);
  }

  void kirimEmailLupaPassword() async {
    try {
      if (isButtonEnabled.isTrue) {
        isButtonEnabled.value = false;
        remainingTime.value = 60;
        Timer.periodic(const Duration(seconds: 1), (timer) {
          remainingTime.value--;
          if (remainingTime.value <= 0) {
            isButtonEnabled.value = true;
            timer.cancel();
          }
        });
        await auth.sendPasswordResetEmail(email: email);
      }
    } on FirebaseAuthException catch (e) {
      Get.snackbar(
        'Error',
        e.message ?? 'No Messages',
        backgroundColor: Colors.grey.shade300,
        borderWidth: 0.2,
        duration: const Duration(seconds: 2),
      );
    } on FirebaseException catch (e) {
      Get.snackbar(
        'Error',
        e.message ?? 'No Messages',
        backgroundColor: Colors.grey.shade300,
        borderWidth: 0.2,
        duration: const Duration(seconds: 2),
      );
    } catch (e) {
      Get.snackbar(
        'Error',
        'Terjadi kesalahan!, silahkan coba lagi nanti',
        backgroundColor: Colors.grey.shade300,
        borderWidth: 0.2,
        duration: const Duration(seconds: 2),
      );
    }
  }

  @override
  void onInit() {
    super.onInit();
    email = Get.arguments;
    kirimEmailLupaPassword();
  }
}
