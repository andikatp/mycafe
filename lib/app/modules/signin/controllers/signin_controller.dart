import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:my_cafe/app/routes/app_pages.dart';

class SigninController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final formKey = GlobalKey<FormState>();
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  late final AnimationController animationController;
  final auth = FirebaseAuth.instance;
  final fireStore = FirebaseFirestore.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  RxBool isEnabled = false.obs;
  RxBool isLoading = false.obs;

  void signInUsingGoogle() async {
    try {
      final googleAccount = await _googleSignIn.signIn();
      final CollectionReference usersCollection =
          FirebaseFirestore.instance.collection('users');
      final DocumentSnapshot userWithTheSameEmail =
          await usersCollection.doc(googleAccount?.email).get();
      if (!userWithTheSameEmail.exists) {
        Get.snackbar(
          'Error',
          'Akun gmail tidak ditemukan, silahkan daftar terlebih dahulu',
          backgroundColor: Colors.grey.shade300,
          borderWidth: 0.2,
          duration: const Duration(seconds: 2),
        );
        Get.offAllNamed(Routes.SIGNUP);
      }
      final GoogleSignInAuthentication? googleAuth =
          await googleAccount?.authentication;
      final OAuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);
      await auth.signInWithCredential(credential);
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

  void signInUsingEmailAndPassword() async {
    try {
      isLoading.toggle();
      bool? isValidate = formKey.currentState?.validate();
      if (isValidate!) {
        await auth.signInWithEmailAndPassword(
            email: emailController.text, password: passwordController.text);
      }
      isLoading.toggle();
    } on FirebaseAuthException catch (e) {
      Get.snackbar(
        'Error',
        e.message ?? 'No Messages',
        backgroundColor: Colors.grey.shade300,
        borderWidth: 0.2,
        duration: const Duration(seconds: 2),
      );
      isLoading.toggle();
    } on FirebaseException catch (e) {
      Get.snackbar(
        'Error',
        e.message ?? 'No Messages',
        backgroundColor: Colors.grey.shade300,
        borderWidth: 0.2,
        duration: const Duration(seconds: 2),
      );
      isLoading.toggle();
    } catch (e) {
      Get.snackbar(
        'Error',
        'Terjadi kesalahan!, silahkan coba lagi nanti',
        backgroundColor: Colors.grey.shade300,
        borderWidth: 0.2,
        duration: const Duration(seconds: 2),
      );
      isLoading.toggle();
    }
  }

  void goToSignUp() {
    Get.offAllNamed(Routes.SIGNUP);
  }

  void goToLupaPassword() {
    Get.toNamed(Routes.LUPA_PASSWORD);
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
    animationController = AnimationController(vsync: this);
    super.onInit();
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    animationController.dispose();
    super.onClose();
  }
}
