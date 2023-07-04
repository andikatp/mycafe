import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../routes/app_pages.dart';

class VerifyEmailController extends GetxController {
  final auth = FirebaseAuth.instance;
  late Timer timer;
  RxBool isButtonEnabled = true.obs;
  final remainingTime = 0.obs;

  void sendEmailVerification() async {
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
      }
      await auth.currentUser?.sendEmailVerification();
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

  void chekEmailVerified() async {
    await auth.currentUser?.reload();
    if (auth.currentUser!.emailVerified) {
      Get.offAllNamed(Routes.HOME);
      timer.cancel();
    }
  }

  void getBackTologin() {
    Get.offAllNamed(Routes.SIGNIN);
  }

  @override
  void onInit() {
    super.onInit();
    sendEmailVerification();
    timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      chekEmailVerified();
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  void onClose() {
    timer.cancel();
    super.onClose();
  }
}
