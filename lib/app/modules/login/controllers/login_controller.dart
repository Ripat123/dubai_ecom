import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final TextEditingController phoneController = TextEditingController();
  final RxString selectedCountryCode = '+974'.obs;

  void changeCountryCode(String code) {
    selectedCountryCode.value = code;
  }

  void login() {
    if (phoneController.text.isEmpty) {
      Get.snackbar("Error", "Please enter your mobile number",
          snackPosition: SnackPosition.BOTTOM);
      return;
    }
    // Implement your login logic here
    Get.snackbar("Success", "Proceeding with login",
        snackPosition: SnackPosition.BOTTOM);
  }

  @override
  void onClose() {
    phoneController.dispose();
    super.onClose();
  }
}
