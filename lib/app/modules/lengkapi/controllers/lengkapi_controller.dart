import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LengkapiController extends GetxController {
  final formKey = GlobalKey<FormState>();
  late final TextEditingController namaCafe;
  late final TextEditingController jumlahLantai;
  late final TextEditingController jumlahKursiPerLantai;
  late final TextEditingController namaPemilik;
  late final TextEditingController nomorTeleponPemilik;
  late final TextEditingController alamatCafe;
  RxBool isEnabled = false.obs;
  final auth = FirebaseAuth.instance;
  final fireStore = FirebaseFirestore.instance;

  void daftarAkun(String email, String password) async {
    final isValid = formKey.currentState!.validate();
    if (isValid) {
      try {
        final userData = await auth.createUserWithEmailAndPassword(
            email: email, password: password);
        final userDoc = fireStore.collection('users').doc(userData.user?.email);
        if (!nomorTeleponPemilik.text.startsWith('0')) {
          nomorTeleponPemilik.text = '+62${nomorTeleponPemilik.text}';
        }

        await userDoc.set({
          'uid': userData.user?.uid,
          'email': userData.user?.email,
          'nama_cafe': namaCafe.text,
          'nama_pemilik': namaPemilik.text,
          'nomorTeleponPemilik': nomorTeleponPemilik.text,
          'jumlahLantai': jumlahLantai.text,
          'jumlahKursiPerLantai': jumlahKursiPerLantai.text,
          'alamatCafe': alamatCafe.text,
          'createdAt': userData.user?.metadata.creationTime,
          'updatedAt': DateTime.now().toIso8601String(),
        });
        final currentUser = FirebaseAuth.instance.currentUser;
        print(currentUser);
      } on FirebaseAuthException catch (e) {
        Get.snackbar(
          'Error',
          e.message ?? 'No Messages',
          backgroundColor: Colors.grey.shade300,
          borderWidth: 0.2,
          duration: const Duration(seconds: 2),
        );
      } on FirebaseException catch (e) {
        Get.snackbar(
          'Error',
          e.message ?? 'No Messages',
          backgroundColor: Colors.grey.shade300,
          borderWidth: 0.2,
          duration: const Duration(seconds: 2),
        );
      } catch (e) {
        Get.snackbar(
          'Error',
          'Terjadi kesalahan!, silahkan coba lagi nanti',
          backgroundColor: Colors.grey.shade300,
          borderWidth: 0.2,
          duration: const Duration(seconds: 2),
        );
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
