import 'package:dubai_ecocm/app/data/ItemModel.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  final RxList<ItemModel> items = <ItemModel>[].obs;
  final RxList<ItemModel> banners = <ItemModel>[].obs;
  final RxList<ItemModel> foods = <ItemModel>[].obs;
  final RxBool isLoading = true.obs;
  final RxBool isBannerLoading = true.obs;
  final RxBool isFoodLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchItems();
    fetchBanners();
    fetchFoods();
  }

  Future<void> fetchItems() async {
    try {
      // Simulate fetching data (replace with your actual data fetching logic)
      await Future.delayed(Duration(seconds: 1)); // Simulate network delay

      //Example data (replace with your actual data)
      items.value = [
        ItemModel(id: 1,imgUrl: 'https://snoonu.com/_next/image?url=https%3A%2F%2Fimages.snoonu.com%2Fimage_category%2F2024-02%2Fbe15c7bd-bd5c-4fd4-b0da-3407daf3b67d_phpzcFN55.png&w=1920&q=75', title: 'Restaurant'),
        ItemModel(id: 1,imgUrl: 'https://snoonu.com/_next/image?url=https%3A%2F%2Fimages.snoonu.com%2Fimage_category%2F2024-02%2Fd9ad5215-1676-4479-bcab-419eba96c509_php52a5Nv.png&w=1920&q=75', title: 'Grocery'),
        ItemModel(id: 1,imgUrl: 'https://snoonu.com/_next/image?url=https%3A%2F%2Fimages.snoonu.com%2Fimage_category%2F2024-02%2Ff5b3eba2-f4de-4f95-b7e5-9e936943b2ed_phpJZyEL4.png&w=1920&q=75', title: 'Hotel Booking'),
        ItemModel(id: 1,imgUrl: 'https://snoonu.com/_next/image?url=https%3A%2F%2Fimages.snoonu.com%2Fimage_category%2F2024-02%2F7326aac7-6656-48fb-9ad8-2f0435d8da39_phpQRkPrq.png&w=1920&q=75', title: 'Flowers and Gift'),
        ItemModel(id: 1,imgUrl: 'https://snoonu.com/_next/image?url=https%3A%2F%2Fimages.snoonu.com%2Fservice_box_banners%2F2024-06%2F1963e95a-fe6a-4660-b64a-42d33fbdf3df_output.png&w=1920&q=75', title: 'Pharmacy'),
        ItemModel(id: 1,imgUrl: 'https://snoonu.com/_next/image?url=https%3A%2F%2Fimages.snoonu.com%2Fimage_category%2F2024-04%2Fc069a933-0d63-41cb-83f9-3702a4c087e9_phpXaMBzR.png&w=1920&q=75', title: 'Health & Beauty'),
        ItemModel(id: 1,imgUrl: 'https://snoonu.com/_next/image?url=https%3A%2F%2Fimages.snoonu.com%2Fimage_category%2F2024-04%2Fde34a290-188a-49b6-a39b-980af9f05704_phpSnATBz.png&w=1920&q=75', title: 'Clothes & Accessories'),
        ItemModel(id: 1,imgUrl: 'https://snoonu.com/_next/image?url=https%3A%2F%2Fimages.snoonu.com%2Fimage_category%2F2024-04%2F9768712b-5f65-4741-a59c-917ba01bd6a6_phpcgnYzC.png&w=1920&q=75', title: 'Books % Stationary')
      ];
    } catch (e) {
      // Handle error (e.g., show a snackbar)
      Get.snackbar("Error", "Failed to load items: $e");
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> fetchBanners() async {
    try {
      // Simulate fetching data (replace with your actual data fetching logic)
      await Future.delayed(Duration(seconds: 1)); // Simulate network delay

      //Example data (replace with your actual data)
      banners.value = [
        ItemModel(id: 1,imgUrl: 'https://snoonu.com/_next/image?url=%2F_next%2Fstatic%2Fmedia%2Foutdoor_adventures.9d55419f.jpg&w=3840&q=75', title: 'Restaurant'),
        ItemModel(id: 1,imgUrl: 'https://snoonu.com/_next/image?url=%2F_next%2Fstatic%2Fmedia%2Fbudget_friendly.534119b4.jpg&w=3840&q=75', title: 'Star'),
        ItemModel(id: 1,imgUrl: 'https://snoonu.com/_next/image?url=https%3A%2F%2Fimages.snoonu.com%2Fbrand%2F2024-08%2Fe182c52d-d15c-4df9-a109-41adf1731f0d_output.png%3Fformat%3Dwebp&w=1920&q=75', title: 'Hotel Booking'),
      ];
    } catch (e) {
      // Handle error (e.g., show a snackbar)
      Get.snackbar("Error", "Failed to load Banners: $e");
    } finally {
      isBannerLoading.value = false;
    }
  }

  Future<void> fetchFoods() async {
    try {
      // Simulate fetching data (replace with your actual data fetching logic)
      await Future.delayed(Duration(seconds: 1)); // Simulate network delay

      //Example data (replace with your actual data)
      foods.value = [
        ItemModel(id: 1,imgUrl: 'https://images.immediate.co.uk/production/volatile/sites/30/2020/08/chorizo-mozarella-gnocchi-bake-cropped-9ab73a3.jpg', title: 'Pizza'),
        ItemModel(id: 1,imgUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSjAMLedZRk2kc2Gg7NC0jRaHIjxa1-vf-b_A&s', title: 'Burger'),
        ItemModel(id: 1,imgUrl: 'https://shotejbazar.com/wp-content/uploads/2023/09/coffee-brain-caffeine-neuroscincces.webp', title: 'Coffee'),
        ItemModel(id: 1,imgUrl: 'https://snoonu.com/_next/image?url=https%3A%2F%2Fimages.snoonu.com%2Fbrand%2F2024-01%2F707b8a61-fe87-40fc-94b8-2e2059d4a97b_nO4bCcS0w3.jpeg%3Fformat%3Dwebp&w=1920&q=75', title: 'Tea'),
        ItemModel(id: 1,imgUrl: 'https://images.snoonu.com/brand/2024-10/c3115317-20e6-4df6-a546-382f0e0c5b86_output.png?format=webp', title: 'Noodles'),
      ];
    } catch (e) {
      // Handle error (e.g., show a snackbar)
      Get.snackbar("Error", "Failed to load Banners: $e");
    } finally {
      isFoodLoading.value = false;
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


