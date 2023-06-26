import 'package:get/get.dart';

import '../controllers/lengkapi_controller.dart';

class LengkapiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LengkapiController>(
      () => LengkapiController(),
    );
  }
}
