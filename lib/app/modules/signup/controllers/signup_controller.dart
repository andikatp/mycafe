import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:my_cafe/app/routes/app_pages.dart';

class SignupController extends GetxController {
  final formKey = GlobalKey<FormState>();
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  final firestore = FirebaseFirestore.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FacebookAuth _facebookSignIn = FacebookAuth.instance;

  final auth = FirebaseAuth.instance;
  RxBool checkUser = false.obs;
  RxBool isEnabled = false.obs;
  RxBool isLoading = false.obs;

  Future<bool> getDocDenganEmailYangSama(String email) async {
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

  void signUpMenggunakanEmailDanPassword(String email, String password) async {
    final isValid = formKey.currentState?.validate();
    isLoading.toggle();
    final emailExist = await getDocDenganEmailYangSama(email);
    if (isValid!) {
      if (emailExist) {
        Get.offAllNamed(Routes.SIGNIN, arguments: email);
      } else {
        Get.toNamed(Routes.LENGKAPI, arguments: {
          'email': emailController.text.trim(),
          'password': passwordController.text.trim(),
          'method': 'emailandpassword'
        });
      }
    }
    isLoading.toggle();
  }

  void signUpMenggunakanFacebook() async {
    try {
      final LoginResult result = await _facebookSignIn.login();
      if (result.status == LoginStatus.success) {
        final userData = await FacebookAuth.instance.getUserData();
        final String email = userData['email'];
        final emailExist = await getDocDenganEmailYangSama(email);
        final token = result.accessToken!.token;
        final OAuthCredential credential =
            FacebookAuthProvider.credential(token);
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
            'email': emailController.text.trim(),
            'method': 'facebook',
            'credential': credential
          });
        }
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

  void signUpMenggunakanGmail() async {
    try {
      final GoogleSignInAccount? googleAccount;
      googleAccount = await _googleSignIn.signIn();
      final emailExist = await getDocDenganEmailYangSama(googleAccount!.email);
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
          'email': emailController.text.trim(),
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
