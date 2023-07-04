import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../../../utils/custom_chage_page.dart';
import '../../../utils/custom_text_field.dart';
import '../controllers/signin_controller.dart';

class SigninView extends GetView<SigninController> {
  const SigninView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final width = Get.width;
    final theme = Get.theme;
    final String? email = Get.arguments;
    if (email != null) {
      controller.emailController.text = email;
    }
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Form(
        key: controller.formKey,
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            KeyboardVisibilityBuilder(
              builder: (context, isKeyboardVisible) => isKeyboardVisible
                  ? const SizedBox()
                  : Stack(
                      alignment: Alignment.center,
                      children: [
                        Lottie.asset(
                          'assets/logo/bglogo.json',
                          height: 150,
                          width: 150,
                          controller: controller.animationController,
                          onLoaded: (composotion) =>
                              controller.animationController
                                ..duration = composotion.duration * 1.7
                                ..repeat(),
                          repeat: true,
                        ),
                        Image.asset(
                          'assets/images/logo.png',
                          height: 90,
                          width: 90,
                        ),
                      ],
                    ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Masuk ke akun ',
                  style: theme.textTheme.headlineSmall
                      ?.copyWith(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                Text(
                  'MyCafe.',
                  style: theme.textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Get.theme.primaryColor),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            const SizedBox(height: 20),
            CustomTextfield(
              text: 'Email Anda',
              hintText: 'nama@email.com',
              textEditingController: controller.emailController,
              inputType: TextInputType.emailAddress,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Kolom ini tidak boleh kosong';
                }
                if (!value.contains('@')) {
                  return 'Pastikan format email anda benar';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            CustomTextfield(
              text: 'Kata Sandi',
              hintText: '*******',
              textEditingController: controller.passwordController,
              password: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Kolom ini tidak boleh kosong';
                }
                if (value.length <= 6) {
                  return 'Kata sandi harus mengandung setidaknya 6 karakter';
                }
                return null;
              },
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 10),
                child: TextButton(
                    onPressed: () => controller.goToLupaPassword(),
                    child: const Text('Lupa Password?')),
              ),
            ),
            const SizedBox(height: 20),
            Obx(
              () => controller.isLoading.value
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Obx(
                        () => ElevatedButton(
                          onPressed: controller.isEnabled.isTrue
                              ? () =>
                                  controller.signInMenggunakanEmailAndPassword()
                              : null,
                          style: ElevatedButton.styleFrom(
                              minimumSize: Size(width, 50),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              )),
                          child: const Text('Masuk'),
                        ),
                      ),
                    ),
            ),
            const SizedBox(height: 20),
            KeyboardVisibilityBuilder(
              builder: (p0, isKeyboardVisible) => isKeyboardVisible
                  ? const SizedBox()
                  : Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: () =>
                                controller.signInMenggunakanGoogle(),
                            iconSize: 40,
                            splashRadius: 30,
                            icon:
                                SvgPicture.asset('assets/logo/logoGoogle.svg'),
                          ),
                          IconButton(
                            onPressed: () =>
                                controller.signInMenggunakanFacebook(),
                            iconSize: 50,
                            splashRadius: 30,
                            icon: const Icon(
                              Icons.facebook,
                              color: Colors.blue,
                            ),
                          ),
                        ],
                      ),
                    ),
            ),
            const Spacer(),
            CustomChangePage(
              message: 'Belum punya akun?',
              keyMessage: ' Daftar',
              function: controller.goToSignUp,
            ),
          ],
        ),
      ),
    );
  }
}
