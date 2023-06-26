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
        await auth
            .createUserWithEmailAndPassword(email: email, password: password)
            .then((value) =>
                fireStore.collection('users').doc(value.user?.uid).set({
                  'uid': value.user?.uid,
                  'email': value.user?.email,
                  'nama_cafe': namaCafe.text,
                  'nama_pemilik': namaPemilik.text,
                  'nomorTeleponPemilik': nomorTeleponPemilik.text,
                  'jumlahLantai': jumlahLantai.text,
                  'jumlahKursiPerLantai': jumlahKursiPerLantai.text,
                  'alamatCafe': alamatCafe.text,
                  'createdAt': value.user?.metadata.creationTime,
                  'updatedAt': null,
                }));
      } on FirebaseAuthException catch (e) {
        // Get.showSnackbar(GetSnackBar(title: e.message!));
        print(e);
      } catch (e) {
        // Get.showSnackbar(GetSnackBar(
        //   title: e.toString(),
        // ));
        print(e.toString());
      }
    }
  }

  @override
  void onInit() {
    namaCafe = TextEditingController()
      ..addListener(() {
        if (namaCafe.text.isNotEmpty &&
            jumlahLantai.text.isNotEmpty &&
            jumlahKursiPerLantai.text.isNotEmpty) {
          isEnabled.value = true;
        } else {
          isEnabled.value = false;
        }
      });
    jumlahLantai = TextEditingController()
      ..addListener(() {
        if (namaCafe.text.isNotEmpty &&
            jumlahLantai.text.isNotEmpty &&
            jumlahKursiPerLantai.text.isNotEmpty) {
          isEnabled.value = true;
        } else {
          isEnabled.value = false;
        }
      });
    jumlahKursiPerLantai = TextEditingController()
      ..addListener(() {
        if (namaCafe.text.isNotEmpty &&
            jumlahLantai.text.isNotEmpty &&
            jumlahKursiPerLantai.text.isNotEmpty) {
          isEnabled.value = true;
        } else {
          isEnabled.value = false;
        }
      });
    namaPemilik = TextEditingController();
    alamatCafe = TextEditingController();
    nomorTeleponPemilik = TextEditingController();

    super.onInit();
  }

  void getBack() {
    Get.back();
  }
}
