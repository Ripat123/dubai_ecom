import 'package:get/get.dart';

import '../../../data/ItemModel.dart';
import '../../../data/SearchItem.dart';

class SearchingController extends GetxController {

  final RxList<ItemModel> foods = <ItemModel>[].obs;

  var trendingSearches = <SearchItem>[
  SearchItem(title: "al zarka restaurant"),
  SearchItem(title: "salsabeel"),
  SearchItem(title: "al shabrawi"),
  SearchItem(title: "arab gulf pastry"),
  SearchItem(title: "beverages"),
  SearchItem(title: "egyptian"),
  SearchItem(title: "lebanese"),
  SearchItem(title: "indian"),
  SearchItem(title: "tacos"),
  SearchItem(title: "mexican"),
  ].obs;

  var trendingCuisines = <SearchItem>[
  SearchItem(title: "Arabic Breakfast", imageUrl: "assets/images/arabic_breakfast.png"),
  SearchItem(title: "Chapati & Karak", imageUrl: "assets/images/chapati_karak.png"),
  SearchItem(title: "Healthy Breakfast", imageUrl: "assets/images/healthy_breakfast.png"),
  SearchItem(title: "Desi Breakfast", imageUrl: "assets/images/desi_breakfast.png"),
  ].obs;

  Future<void> fetchFoods() async {
    try {

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
    }
  }

  @override
  void onInit() {
    super.onInit();
    fetchFoods();
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
