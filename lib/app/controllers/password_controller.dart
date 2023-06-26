import 'package:get/get.dart';

class PasswordController extends GetxController {
  RxBool isObsecure = false.obs;

  void toggleObsecure() => isObsecure.toggle();
}
