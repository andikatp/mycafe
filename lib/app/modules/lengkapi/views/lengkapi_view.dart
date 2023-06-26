import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import '../../../utils/custom_text_field.dart';
import '../controllers/lengkapi_controller.dart';

class LengkapiView extends GetView<LengkapiController> {
  const LengkapiView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final Map<String, String>? emailAndPassword = Get.arguments;
    final theme = Get.theme;
    final width = Get.width;
    final height = Get.height;
    String completeNumber = '';
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: GestureDetector(
              child: const Icon(Icons.chevron_left, size: 40),
              onTap: () => controller.getBack(),
            ),
            pinned: true,
            elevation: 1,
            foregroundColor: Colors.black,
            backgroundColor: const Color(0xFFf5f5f5),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                KeyboardVisibilityBuilder(
                  builder: (p0, isKeyboardVisible) => isKeyboardVisible
                      ? const SizedBox()
                      : Column(
                          children: [
                            SizedBox(height: height * 0.02),
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
                                  style: theme.textTheme.headlineSmall
                                      ?.copyWith(
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
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Kolom ini tidak boleh kosong';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: height * 0.03),
                      CustomTextfield(
                        text: 'Nama Pemilik',
                        hintText: 'Bambang Hermanto',
                        textEditingController: controller.namaPemilik,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Kolom ini tidak boleh kosong';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: height * 0.03),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Nomor Telepon Pemilik',
                              style: theme.textTheme.bodyLarge!
                                  .copyWith(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 5),
                            IntlPhoneField(
                              controller: controller.nomorTeleponPemilik,
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                        color: Colors.grey.shade500)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: theme.primaryColor,
                                    )),
                                errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide:
                                        BorderSide(color: theme.primaryColor)),
                                focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide:
                                        BorderSide(color: theme.primaryColor)),
                                contentPadding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                hintText: '812 3456 7890',
                                hintStyle:
                                    TextStyle(color: Colors.grey.shade500),
                              ),
                              initialCountryCode: 'ID',
                              onChanged: (value) =>
                                  completeNumber = value.completeNumber,
                              disableLengthCheck: true,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: height * 0.03),
                      CustomTextfield(
                        text: 'Jumlah Lantai Cafe',
                        hintText: '1',
                        inputType: TextInputType.number,
                        textEditingController: controller.jumlahLantai,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Kolom ini tidak boleh kosong';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: height * 0.03),
                      CustomTextfield(
                        text: 'Jumlah Kursi Per Lantai',
                        hintText: '20',
                        inputType: TextInputType.number,
                        textEditingController: controller.jumlahKursiPerLantai,
                        validator: (p0) {
                          return null;
                        },
                      ),
                      SizedBox(height: height * 0.03),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Alamat Cafe',
                              style: theme.textTheme.bodyLarge!
                                  .copyWith(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 5),
                            TextFormField(
                              controller: controller.alamatCafe,
                              decoration: InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                        color: Colors.grey.shade500)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: theme.primaryColor,
                                    )),
                                errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide:
                                        BorderSide(color: theme.primaryColor)),
                                focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide:
                                        BorderSide(color: theme.primaryColor)),
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                hintText:
                                    'Jalan Indah Harapan, Nomor 3, Banda Aceh',
                                hintStyle:
                                    TextStyle(color: Colors.grey.shade500),
                              ),
                              maxLines: 7,
                              maxLength: 250,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Kolom ini tidak boleh kosong';
                                }
                                return null;
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: height * 0.05),
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
                    onPressed: controller.isEnabled.isTrue
                        ? () => controller.daftarAkun(
                              emailAndPassword?['email'] as String,
                              emailAndPassword?['password'] as String,
                              completeNumber,
                            )
                        : null,
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
          ),
        ],
      ),
    );
  }
}
