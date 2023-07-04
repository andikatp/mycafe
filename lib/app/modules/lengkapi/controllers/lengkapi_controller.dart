import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LengkapiController extends GetxController {
  final formKey = GlobalKey<FormState>();
  late final TextEditingController namaCafe;
  late final TextEditingController jumlahLantai;
  late final TextEditingController jumlahKursiPerLantai;
  late final TextEditingController namaPemilik;
  late final TextEditingController nomorTeleponPemilik;
  late final TextEditingController alamatCafe;
  final auth = FirebaseAuth.instance;
  final fireStore = FirebaseFirestore.instance;
  late final GoogleSignInAccount? googleAccount;
  RxBool isEnabled = false.obs;
  RxBool isLoading = false.obs;

  Future masukkanDataKeDatabase() async {}

  void daftarAkunMenggunakanGoogleSignIn(
      String email, String completeNumber, OAuthCredential? credential) async {
    isLoading.toggle();
    final isValid = formKey.currentState!.validate();
    if (isValid) {
      try {
        final UserCredential userData =
            await auth.signInWithCredential(credential!);
        final userDoc = fireStore.collection('users').doc(userData.user?.email);
        await userDoc.set({
          'uid': userData.user?.uid,
          'email': userData.user?.email,
          'nama_cafe': namaCafe.text.trim(),
          'nama_pemilik': namaPemilik.text.trim(),
          'nomorTeleponPemilik': completeNumber.trim(),
          'jumlahLantai': int.tryParse(jumlahLantai.text.trim()),
          'jumlahKursiPerLantai':
              int.tryParse(jumlahKursiPerLantai.text.trim()),
          'alamatCafe': alamatCafe.text.trim(),
          'createdAt': userData.user?.metadata.creationTime,
          'updatedAt': DateTime.now().toIso8601String(),
        });
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
  }

  void daftarAkunMenggunakanFacebook(
      String email, String completeNumber, OAuthCredential credential) async {
    isLoading.toggle();
    isLoading.toggle();
    final isValid = formKey.currentState!.validate();
    if (isValid) {
      try {
        final UserCredential userData =
            await auth.signInWithCredential(credential);
        final userDoc = fireStore.collection('users').doc(userData.user?.email);
        await userDoc.set({
          'uid': userData.user?.uid,
          'email': userData.user?.email,
          'nama_cafe': namaCafe.text.trim(),
          'nama_pemilik': namaPemilik.text.trim(),
          'nomorTeleponPemilik': completeNumber.trim(),
          'jumlahLantai': int.tryParse(jumlahLantai.text.trim()),
          'jumlahKursiPerLantai':
              int.tryParse(jumlahKursiPerLantai.text.trim()),
          'alamatCafe': alamatCafe.text.trim(),
          'createdAt': userData.user?.metadata.creationTime,
          'updatedAt': DateTime.now().toIso8601String(),
        });
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
  }

  void daftarAkunMenggunakanEmaildanPassword(
      String email, String password, String completeNumber) async {
    isLoading.toggle();
    final isValid = formKey.currentState!.validate();
    if (isValid) {
      try {
        final UserCredential userData = await auth
            .createUserWithEmailAndPassword(email: email, password: password);
        final userDoc = fireStore.collection('users').doc(userData.user?.email);
        await userDoc.set({
          'uid': userData.user?.uid,
          'email': userData.user?.email,
          'nama_cafe': namaCafe.text.trim(),
          'nama_pemilik': namaPemilik.text.trim(),
          'nomorTeleponPemilik': completeNumber.trim(),
          'jumlahLantai': int.tryParse(jumlahLantai.text.trim()),
          'jumlahKursiPerLantai':
              int.tryParse(jumlahKursiPerLantai.text.trim()),
          'alamatCafe': alamatCafe.text.trim(),
          'createdAt': userData.user?.metadata.creationTime,
          'updatedAt': DateTime.now().toIso8601String(),
        });
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
  }

  @override
  void onInit() {
    namaCafe = TextEditingController()
      ..addListener(() {
        if (namaCafe.text.isNotEmpty &&
            namaPemilik.text.isNotEmpty &&
            nomorTeleponPemilik.text.isNotEmpty &&
            jumlahLantai.text.isNotEmpty &&
            jumlahKursiPerLantai.text.isNotEmpty &&
            alamatCafe.text.isNotEmpty) {
          isEnabled.value = true;
        } else {
          isEnabled.value = false;
        }
      });
    jumlahLantai = TextEditingController()
      ..addListener(() {
        if (namaCafe.text.isNotEmpty &&
            namaPemilik.text.isNotEmpty &&
            nomorTeleponPemilik.text.isNotEmpty &&
            jumlahLantai.text.isNotEmpty &&
            jumlahKursiPerLantai.text.isNotEmpty &&
            alamatCafe.text.isNotEmpty) {
          isEnabled.value = true;
        } else {
          isEnabled.value = false;
        }
      });
    jumlahKursiPerLantai = TextEditingController()
      ..addListener(() {
        if (namaCafe.text.isNotEmpty &&
            namaPemilik.text.isNotEmpty &&
            nomorTeleponPemilik.text.isNotEmpty &&
            jumlahLantai.text.isNotEmpty &&
            jumlahKursiPerLantai.text.isNotEmpty &&
            alamatCafe.text.isNotEmpty) {
          isEnabled.value = true;
        } else {
          isEnabled.value = false;
        }
      });
    namaPemilik = TextEditingController()
      ..addListener(() {
        if (namaCafe.text.isNotEmpty &&
            namaPemilik.text.isNotEmpty &&
            nomorTeleponPemilik.text.isNotEmpty &&
            jumlahLantai.text.isNotEmpty &&
            jumlahKursiPerLantai.text.isNotEmpty &&
            alamatCafe.text.isNotEmpty) {
          isEnabled.value = true;
        } else {
          isEnabled.value = false;
        }
      });
    alamatCafe = TextEditingController()
      ..addListener(() {
        if (namaCafe.text.isNotEmpty &&
            namaPemilik.text.isNotEmpty &&
            nomorTeleponPemilik.text.isNotEmpty &&
            jumlahLantai.text.isNotEmpty &&
            jumlahKursiPerLantai.text.isNotEmpty &&
            alamatCafe.text.isNotEmpty) {
          isEnabled.value = true;
        } else {
          isEnabled.value = false;
        }
      });
    nomorTeleponPemilik = TextEditingController()
      ..addListener(() {
        if (namaCafe.text.isNotEmpty &&
            namaPemilik.text.isNotEmpty &&
            nomorTeleponPemilik.text.isNotEmpty &&
            jumlahLantai.text.isNotEmpty &&
            jumlahKursiPerLantai.text.isNotEmpty &&
            alamatCafe.text.isNotEmpty) {
          isEnabled.value = true;
        } else {
          isEnabled.value = false;
        }
      });

    super.onInit();
  }

  void getBack() {
    Get.back();
  }
}
