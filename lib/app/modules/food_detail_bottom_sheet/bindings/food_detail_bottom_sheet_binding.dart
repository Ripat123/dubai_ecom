import 'package:get/get.dart';

import '../controllers/food_detail_bottom_sheet_controller.dart';

class FoodDetailBottomSheetBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FoodDetailBottomSheetController>(
      () => FoodDetailBottomSheetController(),
    );
  }
}
