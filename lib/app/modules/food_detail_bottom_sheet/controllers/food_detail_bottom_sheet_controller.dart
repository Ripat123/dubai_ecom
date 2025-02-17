import 'package:get/get.dart';

class FoodDetailBottomSheetController extends GetxController {

  var quantity = 1.obs;
  var specialRequest = "".obs;

  void increaseQuantity() {
    quantity.value++;
  }

  void decreaseQuantity() {
    if (quantity.value > 1) {
      quantity.value--;
    }
  }

  void updateSpecialRequest(String value) {
    specialRequest.value = value;
  }

  void addToCart() {
    print("Added ${quantity.value} items to cart with note: ${specialRequest.value}");
    Get.back(); // Close bottom sheet
    Get.snackbar("Cart", "${quantity.value} item(s) added to cart!", snackPosition: SnackPosition.BOTTOM);
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
