import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/lupa_password_controller.dart';

class LupaPasswordView extends GetView<LupaPasswordController> {
  const LupaPasswordView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final theme = Get.theme;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Back'),
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Text(
              'Reset Password',
              style: theme.textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold, color: const Color(0xFF0d0d0d)),
            ),
            const SizedBox(height: 20),
            Text(
              'Masukkan email yang terhubung dengan akun anda dan kami akan mengirimkan email serta instruksi untuk mereset password anda.',
              style: theme.textTheme.bodyLarge
                  ?.copyWith(color: Colors.black.withOpacity(0.6), height: 1.5),
            ),
            const SizedBox(height: 30),
            Text('Email Address',
                style: theme.textTheme.bodyLarge!
                    .copyWith(fontWeight: FontWeight.bold)),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: TextField(
                controller: controller.emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.grey.shade500)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: theme.primaryColor,
                      )),
                  errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: theme.primaryColor)),
                  focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: theme.primaryColor)),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                  hintText: 'mycafe@app.com',
                  hintStyle: TextStyle(color: Colors.grey.shade500),
                ),
                onTapOutside: (event) => FocusScope.of(Get.context!).unfocus(),
              ),
            ),
            const SizedBox(height: 5),
            Obx(
              () => ElevatedButton(
                onPressed: controller.isEnabled.isTrue
                    ? () => controller.pergiKeLupaPasswordEmail()
                    : null,
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(
                    double.infinity,
                    50,
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                child: const Text('Kirim Instruksi'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
