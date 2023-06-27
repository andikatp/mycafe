import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:my_cafe/app/routes/app_pages.dart';

class SignupController extends GetxController {
  final formKey = GlobalKey<FormState>();
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  final firestore = FirebaseFirestore.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  final auth = FirebaseAuth.instance;
  RxBool checkUser = false.obs;
  RxBool isEnabled = false.obs;
  RxBool isLoading = false.obs;

  Future<bool> getDocWithTheSameEmail(String email) async {
    try {
      final CollectionReference usersCollection =
          FirebaseFirestore.instance.collection('users');
      final DocumentSnapshot userWithTheSameEmail =
          await usersCollection.doc(email).get();
      return userWithTheSameEmail.exists;
    } on FirebaseException catch (e) {
      Get.snackbar(
        'Error',
        e.toString(),
        backgroundColor: Colors.grey.shade300,
        borderWidth: 0.2,
        duration: const Duration(seconds: 2),
      );
      return false;
    }
  }

  void signUpWithEmailAndPassword(String email, String password) async {
    final isValid = formKey.currentState?.validate();
    isLoading.toggle();
    final emailExist = await getDocWithTheSameEmail(email);
    if (isValid!) {
      if (emailExist) {
        Get.offAllNamed(Routes.SIGNIN, arguments: email);
      } else {
        Get.toNamed(Routes.LENGKAPI, arguments: {
          'email': emailController.text,
          'password': passwordController.text,
          'method': 'gmail'
        });
      }
    }
    isLoading.toggle();
  }

  void signUpWithGmail() async {
    try {
      final GoogleSignInAccount? googleAccount;
      googleAccount = await _googleSignIn.signIn();
      final emailExist = await getDocWithTheSameEmail(googleAccount!.email);
      final GoogleSignInAuthentication googleAuth =
          await googleAccount.authentication;
      final OAuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
      if (emailExist) {
        Get.snackbar(
          'Error',
          'Sorry, it seems that you have already registered with us using this email address or your Gmail account. Please try to log in using your credentials or reset your password if needed. If you are having trouble accessing your account, please contact our customer support for assistance.',
          backgroundColor: Colors.grey.shade300,
          borderWidth: 0.2,
          duration: const Duration(seconds: 2),
        );
      } else {
        Get.toNamed(Routes.LENGKAPI, arguments: {
          'email': emailController.text,
          'method': 'gmail',
          'credential': credential
        });
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        e.toString(),
        backgroundColor: Colors.grey.shade300,
        borderWidth: 0.2,
        duration: const Duration(seconds: 2),
      );
    }
  }

  @override
  void onInit() {
    emailController = TextEditingController()
      ..addListener(() {
        if (emailController.text.isNotEmpty &&
            passwordController.text.isNotEmpty) {
          isEnabled.value = true;
        } else {
          isEnabled.value = false;
        }
      });
    passwordController = TextEditingController()
      ..addListener(() {
        if (emailController.text.isNotEmpty &&
            passwordController.text.isNotEmpty) {
          isEnabled.value = true;
        } else {
          isEnabled.value = false;
        }
      });
    super.onInit();
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();

    super.onClose();
  }
}
