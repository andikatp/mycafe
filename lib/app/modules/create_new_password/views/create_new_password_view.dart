import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/create_new_password_controller.dart';

class CreateNewPasswordView extends GetView<CreateNewPasswordController> {
  const CreateNewPasswordView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final theme = Get.theme;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text('Back'),
          leading: GestureDetector(
            onTap: () {},
            child: const Icon(Icons.arrow_back),
          ),
          backgroundColor: Colors.transparent,
          foregroundColor: const Color(0xFF0d0d0d),
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Buat password baru',
                style: theme.textTheme.headlineMedium?.copyWith(
                    color: const Color(0xFF0d0d0d),
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(right: 35),
                child: Text(
                    'Password baru anda harus berbeda dengan password yang anda gunakan sebelumnya.',
                    style: theme.textTheme.bodyMedium?.copyWith(
                        color: Colors.black.withOpacity(0.7), height: 1.5)),
              ),
              const SizedBox(height: 30),
              Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Password'),
                    const SizedBox(height: 10),
                    TextFormField(
                      onTapOutside: (event) => FocusScope.of(context).unfocus(),
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(color: Colors.grey.shade500)),
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
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 10),
                        hintText: '********',
                        hintStyle: TextStyle(color: Colors.grey.shade500),
                        suffixIcon: const Icon(Icons.remove_red_eye),
                      ),
                      obscureText: true,
                    ),
                    const SizedBox(height: 5),
                    const Text('Password harus setidaknya 8 karakter.'),
                    const SizedBox(height: 20),
                    const Text('Confim Password'),
                    const SizedBox(height: 10),
                    TextFormField(
                      onTapOutside: (event) => FocusScope.of(context).unfocus(),
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(color: Colors.grey.shade500)),
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
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 10),
                        hintText: '********',
                        hintStyle: TextStyle(color: Colors.grey.shade500),
                        suffixIcon: const Icon(Icons.remove_red_eye),
                      ),
                    ),
                    const SizedBox(height: 5),
                    const Text('Kedua password harus sama.'),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: const Text('Reset Password'),
              ),
            ],
          ),
        ));
  }
}
