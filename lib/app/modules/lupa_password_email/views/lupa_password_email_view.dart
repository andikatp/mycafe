import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_cafe/app/routes/app_pages.dart';
import '../controllers/lupa_password_email_controller.dart';

class LupaPasswordEmailView extends GetView<LupaPasswordEmailController> {
  const LupaPasswordEmailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final theme = Get.theme;
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: theme.primaryColor.withOpacity(0.1),
                      ),
                      child: Icon(
                        Icons.mail,
                        color: theme.primaryColor,
                        size: 50,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Periksa Email Anda',
                      style: theme.textTheme.headlineSmall?.copyWith(
                          color: const Color(0xFF0d0d0d),
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Kami telah mengirimkan pemulihan kata sandi instruksi ke email Anda.',
                      style: theme.textTheme.bodyLarge?.copyWith(
                          color: Colors.black.withOpacity(0.6),
                          fontWeight: FontWeight.w400,
                          height: 1.5),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(
                          170,
                          40,
                        ),
                      ),
                      child: const Text('Kirim Ulang'),
                    ),
                  ],
                ),
              ),
              Text.rich(
                TextSpan(
                  children: [
                    const TextSpan(
                      text: 'Tidak menerima email? Periksa di bagian spam atau',
                    ),
                    TextSpan(
                      text: ' coba dengan email lain',
                      style: theme.textTheme.bodyMedium!.copyWith(
                        color: theme.primaryColor,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => Get.toNamed(Routes.LUPA_PASSWORD),
                    ),
                    const TextSpan(
                      text: '.',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
