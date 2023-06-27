import 'package:get/get.dart';

import '../controllers/lupa_password_email_controller.dart';

class LupaPasswordEmailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LupaPasswordEmailController>(
      () => LupaPasswordEmailController(),
    );
  }
}
