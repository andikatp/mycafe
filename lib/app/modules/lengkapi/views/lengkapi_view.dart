import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

import 'package:get/get.dart';

import '../../widgets/custom_text_field.dart';
import '../controllers/lengkapi_controller.dart';

class LengkapiView extends GetView<LengkapiController> {
  const LengkapiView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final Map<String, String> emailAndPassword = Get.arguments;
    final theme = Get.theme;
    final width = Get.width;
    final height = Get.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        leading: GestureDetector(
          child: const Icon(Icons.chevron_left, size: 40),
          onTap: () => controller.getBack(),
        ),
        elevation: 0,
      ),
      body: Column(
        children: [
          KeyboardVisibilityBuilder(
            builder: (p0, isKeyboardVisible) => isKeyboardVisible
                ? const SizedBox()
                : Column(
                    children: [
                      SizedBox(height: height * 0.05),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Lengkapi Profil Cafe ',
                            style: theme.textTheme.headlineSmall
                                ?.copyWith(fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            'Anda.',
                            style: theme.textTheme.headlineSmall?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: theme.primaryColor),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ],
                  ),
          ),
          SizedBox(height: height * 0.05),
          Form(
            key: controller.formKey,
            child: Column(
              children: [
                CustomTextfield(
                  text: 'Nama Cafe',
                  hintText: 'Suka Cafe',
                  textEditingController: controller.namaCafe,
                  validator: (p0) {
                    return null;
                  },
                ),
                SizedBox(height: height * 0.03),
                CustomTextfield(
                  text: 'Jumlah Lantai Cafe',
                  hintText: '1',
                  textEditingController: controller.jumlahLantai,
                  validator: (p0) {
                    return null;
                  },
                ),
                SizedBox(height: height * 0.03),
                CustomTextfield(
                  text: 'Jumlah Kursi Per Lantai',
                  hintText: '20',
                  textEditingController: controller.jumlahKursiPerLantai,
                  validator: (p0) {
                    return null;
                  },
                ),
              ],
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'Dengan mengklik Daftar, kamu setuju dengan ',
                    style: theme.textTheme.bodySmall,
                  ),
                  TextSpan(
                    text: 'Syarat dan Ketentuan',
                    style: theme.textTheme.bodySmall!
                        .copyWith(color: theme.primaryColor),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        debugPrint('syarat dan ketentuan');
                      },
                  ),
                  TextSpan(
                    text: ' serta ',
                    style: theme.textTheme.bodySmall,
                  ),
                  TextSpan(
                    text: 'Kebijakan Privasi',
                    style: theme.textTheme.bodySmall!
                        .copyWith(color: theme.primaryColor),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        debugPrint('Kebijakan Privasi');
                      },
                  ),
                  TextSpan(
                    text: ' yang ditetapkan oleh MyCafe.',
                    style: theme.textTheme.bodySmall,
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: height * 0.03),
          Obx(
            () => ElevatedButton(
              onPressed: controller.isEnabled.isTrue ? () {} : null,
              style: ElevatedButton.styleFrom(
                minimumSize: Size(
                  width,
                  60,
                ),
                shape: const BeveledRectangleBorder(),
              ),
              child: const Text('Daftar'),
            ),
          ),
        ],
      ),
    );
  }
}
