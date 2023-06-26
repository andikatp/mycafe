import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../controllers/verify_email_controller.dart';

class VerifyEmailView extends GetView<VerifyEmailController> {
  const VerifyEmailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final theme = Get.theme;
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 100),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              LottieBuilder.asset(
                'assets/logo/email.json',
                height: 300,
                width: 300,
              ),
              Text(
                'Periksa Email Anda',
                style: Get.theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Untuk mengkonfirmasi email anda, mohon periksa email anda dan klik link yang ada di email anda',
                textAlign: TextAlign.center,
                style: theme.textTheme.labelLarge?.copyWith(
                  color: Colors.black38,
                  height: 2,
                ),
              ),
              const SizedBox(height: 20),
              Obx(
                () => ElevatedButton(
                  onPressed: controller.isButtonEnabled.value
                      ? controller.sendEmailVerification
                      : null,
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(Get.width, 40),
                    backgroundColor: const Color(0xFF6071fd),
                  ),
                  child: Text(controller.isButtonEnabled.value
                      ? 'Kirim Ulang Email'
                      : 'Tunggu ${controller.remainingTime.value} detik'),
                ),
              ),
              TextButton.icon(
                  onPressed: controller.getBackTologin,
                  icon: const Icon(Icons.arrow_back),
                  label: const Text('Kembali Ke Login'))
            ],
          ),
        ),
      ),
    );
  }
}
