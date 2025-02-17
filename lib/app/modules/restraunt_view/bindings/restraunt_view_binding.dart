import 'package:get/get.dart';

import '../controllers/restraunt_view_controller.dart';

class RestrauntViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RestrauntViewController>(
      () => RestrauntViewController(),
    );
  }
}
