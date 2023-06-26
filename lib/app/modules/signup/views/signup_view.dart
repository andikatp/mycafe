import 'package:dotted_dashed_line/dotted_dashed_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:my_cafe/app/routes/app_pages.dart';
import '../../../utils/custom_chage_page.dart';
import '../../../utils/custom_text_field.dart';
import '../controllers/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  const SignupView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final theme = Get.theme;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Form(
        key: controller.formKey,
        child: Column(
          children: [
            const SizedBox(height: 80),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Ayo gabung ke ',
                  style: theme.textTheme.headlineSmall
                      ?.copyWith(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                Text(
                  'MyCafe!',
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
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  DottedDashedLine(
                    height: 0,
                    width: Get.width * 0.3,
                    axis: Axis.horizontal,
                    dashColor: Colors.grey.shade500,
                  ),
                  const Text('Or Signup With'),
                  DottedDashedLine(
                    height: 0,
                    width: Get.width * 0.3,
                    axis: Axis.horizontal,
                    dashColor: Colors.grey.shade500,
                  ),
                ],
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
                            onPressed: () {},
                            iconSize: 40,
                            splashRadius: 30,
                            icon:
                                SvgPicture.asset('assets/logo/logoGoogle.svg'),
                          ),
                          IconButton(
                            onPressed: () {},
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
            Obx(
              () => controller.isLoading.isTrue
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Obx(
                        () => ElevatedButton(
                          onPressed: controller.isEnabled.isTrue
                              ? () => controller.signUpWithEmailAndPassword(
                                  controller.emailController.text,
                                  controller.passwordController.text)
                              : null,
                          style: ElevatedButton.styleFrom(
                              minimumSize: const Size(double.infinity, 50),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              disabledBackgroundColor:
                                  Colors.grey.withOpacity(0.4)),
                          child: const Text('Daftar'),
                        ),
                      ),
                    ),
            ),
            CustomChangePage(
              function: () => Get.offAndToNamed(Routes.SIGNIN),
              message: 'Sudah punya akun?',
              keyMessage: ' Login',
            )
          ],
        ),
      ),
    );
  }
}
