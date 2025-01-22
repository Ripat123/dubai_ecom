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
      await Future.delayed(Duration(seconds: 2)); // Simulate network delay

      //Example data (replace with your actual data)
      items.value = [
        ItemModel(id: 1,imgUrl: 'assets/images/Hotel_Booking.png', title: 'Restaurant'),
        ItemModel(id: 1,imgUrl: 'assets/images/Hotel_Booking.png', title: 'Star'),
        ItemModel(id: 1,imgUrl: 'assets/images/Hotel_Booking.png', title: 'Hotel Booking'),
        ItemModel(id: 1,imgUrl: 'assets/images/Hotel_Booking.png', title: 'Item 4'),
        ItemModel(id: 1,imgUrl: 'assets/images/Hotel_Booking.png', title: 'Item 5'),
        ItemModel(id: 1,imgUrl: 'assets/images/Hotel_Booking.png', title: 'Item 6'),
        ItemModel(id: 1,imgUrl: 'assets/images/Hotel_Booking.png', title: 'Item 7'),
        ItemModel(id: 1,imgUrl: 'assets/images/Hotel_Booking.png', title: 'Item 8')
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
      await Future.delayed(Duration(seconds: 2)); // Simulate network delay

      //Example data (replace with your actual data)
      banners.value = [
        ItemModel(id: 1,imgUrl: 'https://t4.ftcdn.net/jpg/04/95/28/65/360_F_495286577_rpsT2Shmr6g81hOhGXALhxWOfx1vOQBa.jpg', title: 'Restaurant'),
        ItemModel(id: 1,imgUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQA2yc4JD4KAylkt5y8K30W66Zo7qZ35DgD0OqIiw1SU3lDU2sNCVm_I3s2gGs5DYD8Yck&usqp=CAU', title: 'Star'),
        ItemModel(id: 1,imgUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRAWOymIBIAOaWkOX5yNTw_WbXRVWxI-pyYezsH6NBgC2P6KgOjrUPm12Z-GC7Js49vIlI&usqp=CAU', title: 'Hotel Booking'),
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
      await Future.delayed(Duration(seconds: 2)); // Simulate network delay

      //Example data (replace with your actual data)
      foods.value = [
        ItemModel(id: 1,imgUrl: 'https://images.immediate.co.uk/production/volatile/sites/30/2020/08/chorizo-mozarella-gnocchi-bake-cropped-9ab73a3.jpg', title: 'Pizza'),
        ItemModel(id: 1,imgUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSjAMLedZRk2kc2Gg7NC0jRaHIjxa1-vf-b_A&s', title: 'Burger'),
        ItemModel(id: 1,imgUrl: 'https://shotejbazar.com/wp-content/uploads/2023/09/coffee-brain-caffeine-neuroscincces.webp', title: 'Coffee'),
        ItemModel(id: 1,imgUrl: 'assets/images/Hotel_Booking.png', title: 'Tea'),
        ItemModel(id: 1,imgUrl: 'assets/images/Hotel_Booking.png', title: 'Coffee'),
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


