import 'package:dubai_ecocm/app/data/ItemModel.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  final RxList<ItemModel> items = <ItemModel>[].obs;
  final RxBool isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchItems();
  }

  Future<void> fetchItems() async {
    try {
      // Simulate fetching data (replace with your actual data fetching logic)
      await Future.delayed(Duration(seconds: 1)); // Simulate network delay

      // Example data (replace with your actual data)
      items.value = [
        ItemModel(imgUrl: 'https://letsenhance.io/static/8f5e523ee6b2479e26ecc91b9c25261e/1015f/MainAfter.jpg', title: 'Item 1'),
        ItemModel(imgUrl: 'https://letsenhance.io/static/8f5e523ee6b2479e26ecc91b9c25261e/1015f/MainAfter.jpg', title: 'Item 2'),
        ItemModel(imgUrl: 'https://letsenhance.io/static/8f5e523ee6b2479e26ecc91b9c25261e/1015f/MainAfter.jpg', title: 'Item 3')
      ];
    } catch (e) {
      // Handle error (e.g., show a snackbar)
      Get.snackbar("Error", "Failed to load items: $e");
    } finally {
      isLoading.value = false;
    }
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
