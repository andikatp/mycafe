import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LengkapiController extends GetxController {
  final formKey = GlobalKey<FormState>();
  late final TextEditingController namaCafe;
  late final TextEditingController jumlahLantai;
  late final TextEditingController jumlahKursiPerLantai;
  final auth = FirebaseAuth.instance;
  final fireStore = FirebaseFirestore.instance;

  RxBool isEnabled = false.obs;

  void daftarAkun(String email, String password, String namaCafe,
      String jumlahLantai, String jumlahKursiPerLantai) async {
    final isValid = formKey.currentState!.validate();
    if (isValid) {}
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
    super.onInit();
  }

  void getBack() {
    Get.back();
  }
}
