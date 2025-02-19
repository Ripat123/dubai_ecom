import 'package:dubai_ecocm/app/data/productModel.dart';
import 'package:get/get.dart';

import '../../../data/ItemModel.dart';

class MarketController extends GetxController {

  var selectedTab = 0.obs;
  var currentIndex = 0.obs;
  final RxBool isLoading = true.obs;
  final RxList<ItemModel> items = <ItemModel>[].obs;

  var productList = <productModel>[
    productModel(
      imageUrl: 'https://snoonu.com/_next/image?url=https%3A%2F%2Fimages.snoonu.com%2Fbrand_product%2F2024-11%2F483a52e1-9fb3-43f4-aaf0-ea2393a2536e_output.png&w=1920&q=75',
      name: 'New Mini Smartphone',
      price: '238',
      oldPrice: '280 QR',
      discount: '15%',
      isFavorite: false,
    ),
    productModel(
      imageUrl: 'https://snoonu.com/_next/image?url=https%3A%2F%2Fimages.snoonu.com%2Fproduct%2F2024-7%2Fb907203a-d979-4293-8704-0d8bd2938cc5_rimowabag.jpg&w=1920&q=75',
      name: 'Qatar Traveler',
      price: '12',
      isFavorite: false,
    ),
    productModel(
      imageUrl: 'https://snoonu.com/_next/image?url=https%3A%2F%2Fimages.snoonu.com%2Fimage_product%2F2023-06%2FCcGzUDKdec.png&w=1920&q=75',
      name: 'Marj 60MI',
      price: '165',
      isFavorite: false,
    ),
    productModel(
      imageUrl: 'https://snoonu.com/_next/image?url=https%3A%2F%2Fimages.snoonu.com%2Fbrand_product%2F2024-09%2F6c9f1062-af9a-43d1-aafc-32d30054e6b4_output.png&w=1920&q=75',
      name: 'Apple iPhone 15 Pro Max 5G 512GB Blue Titanium',
      price: '4849',
      oldPrice: '5949 QR',
      discount: '18%',
      tag: 'By Snoonu',
      isFavorite: false,
    ),
  ].obs;

  void toggleFavorite(int index) {
    productList[index] = productModel(
      imageUrl: productList[index].imageUrl,
      name: productList[index].name,
      price: productList[index].price,
      oldPrice: productList[index].oldPrice,
      discount: productList[index].discount,
      tag: productList[index].tag,
      isFavorite: !productList[index].isFavorite,
    );
  }

  final List<String> sliderImages = [
    'https://snoonu.com/_next/image?url=%2F_next%2Fstatic%2Fmedia%2Foutdoor_adventures_2.f79deaaa.jpg&w=640&q=75',
    'https://snoonu.com/_next/image?url=%2F_next%2Fstatic%2Fmedia%2Foutdoor_adventures.9d55419f.jpg&w=640&q=75',
    'https://snoonu.com/_next/image?url=%2F_next%2Fstatic%2Fmedia%2Fbudget_friendly.534119b4.jpg&w=640&q=75',
  ];

  Future<void> fetchItems() async {
    try {
      // Simulate fetching data (replace with your actual data fetching logic)

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
    }finally {
      isLoading.value = false;
    }
  }

  @override
  void onInit() {
    super.onInit();
    fetchItems();
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
