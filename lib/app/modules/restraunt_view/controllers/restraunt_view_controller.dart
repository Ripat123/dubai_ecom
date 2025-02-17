import 'package:dubai_ecocm/app/data/productModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/BestItem.dart';
import '../../../data/category.dart';

class RestrauntViewController extends GetxController with GetSingleTickerProviderStateMixin{
  var menuItems = <productModel>[].obs;
  late TabController tabController;
  var selectedCategory = Rxn<CategoryModel>();

  void setSelectedCategory(CategoryModel category) {
    selectedCategory.value = category;
  }
  // final List<String> categories = ["Sandwiches", "Chicken Platters", "Salads & Sides","Sample","Trial"];
  final List<CategoryModel> categories = [
    CategoryModel(title: "Fresh Chicken", imageUrl: "https://snoonu.com/_next/image?url=https%3A%2F%2Fimages.snoonu.com%2Fbrand_product_category%2F2024-09%2Fee12a868-b16a-481b-8f87-7cad0ae027a3_output.png%3Fformat%3Dwebp&w=1920&q=75",itemId: "1"),
    CategoryModel(title: "Chicken Platters", imageUrl: "https://snoonu.com/_next/image?url=https%3A%2F%2Fimages.snoonu.com%2Fimages%2F3f43e361-872e-4d62-9f16-e0abe2d0c89e_6958888057781.jpg&w=1920&q=75",itemId: "2"),
    CategoryModel(title: "Fish & Seafood", imageUrl: "https://snoonu.com/_next/image?url=https%3A%2F%2Fimages.snoonu.com%2Fbrand_product_category%2F2024-09%2Fd36fe9b5-c21c-4e91-85b4-8e6961ed6fda_output.png%3Fformat%3Dwebp&w=1920&q=75",itemId: "3"),
    CategoryModel(title: "Delicatseen", imageUrl: "https://snoonu.com/_next/image?url=https%3A%2F%2Fimages.snoonu.com%2Fbrand_product_category%2F2024-09%2F554bf1ee-0b79-4b57-92d5-c0c99ac3b58d_output.png%3Fformat%3Dwebp&w=1920&q=75",itemId: "4"),
    CategoryModel(title: "Bakery", imageUrl: "https://snoonu.com/_next/image?url=https%3A%2F%2Fimages.snoonu.com%2Fbrand_product_category%2F2024-09%2Ff21e60cd-e1f5-4e84-b79b-40b0ae8a32c9_output.png%3Fformat%3Dwebp&w=1920&q=75",itemId: "5"),
    CategoryModel(title: "Fruits & vegetable", imageUrl: "https://snoonu.com/_next/image?url=https%3A%2F%2Fimages.snoonu.com%2Fbrand_product_category%2F2024-09%2Ffdcf8f04-6bb0-4774-a623-c6bc2d91d68c_output.png%3Fformat%3Dwebp&w=1920&q=75",itemId: "6"),
    CategoryModel(title: "Canned & Jarred Food", imageUrl: "https://snoonu.com/_next/image?url=https%3A%2F%2Fimages.snoonu.com%2Fbrand_product_category%2F2024-09%2F9c1e858e-09f0-4933-8943-dd9c70742e9a_output.png%3Fformat%3Dwebp&w=1920&q=75",itemId: "7"),
    CategoryModel(title: "Cleaning & Laundry", imageUrl: "https://snoonu.com/_next/image?url=https%3A%2F%2Fimages.snoonu.com%2Fbrand_product_category%2F2024-09%2F0e6d8bc3-3302-4b93-bae6-17abd79e6116_output.png%3Fformat%3Dwebp&w=1920&q=75",itemId: "8"),
    CategoryModel(title: "Fruits & vegetable", imageUrl: "https://snoonu.com/_next/image?url=https%3A%2F%2Fimages.snoonu.com%2Fbrand_product_category%2F2024-09%2Ffdcf8f04-6bb0-4774-a623-c6bc2d91d68c_output.png%3Fformat%3Dwebp&w=1920&q=75",itemId: "9"),
  ];

  var bestSellingList = <BestSellingItem>[
    
    BestSellingItem("https://snoonu.com/_next/image?url=https%3A%2F%2Fimages.snoonu.com%2Fproduct%2F2024-5%2F5bcd6689-1e05-49f5-a988-6ce7d0c6d934_WhatsAppImage20240523at14920PM.jpeg&w=1920&q=75", "Mazza Meat", "40"),
    BestSellingItem("https://snoonu.com/_next/image?url=https%3A%2F%2Fimages.snoonu.com%2Fproduct%2F2024-7%2Fee7276e5-33c7-4a20-a413-477850e065be_Lattafayara.webp&w=1920&q=75", "Meat Bab Al Hind", "50"),
    BestSellingItem("https://snoonu.com/_next/image?url=https%3A%2F%2Fimages.snoonu.com%2Fimages%2F3f43e361-872e-4d62-9f16-e0abe2d0c89e_6958888057781.jpg&w=1920&q=75", "Meat Special", "45"),
  ].obs;

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: categories.length, vsync: this);
    selectedCategory.value = categories.first;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // This will run after the widget is built
      loadMenu();
    });
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }

  void loadMenu() {
    menuItems.addAll([
      productModel(
        name: "Chicken Msahab Sandwich",
        description: "Chicken, Lebanese bread, pickles, garlic, and magic sauces.",
        price: 17.0,
        imageUrl: "https://snoonu.com/_next/image?url=https%3A%2F%2Fimages.snoonu.com%2Fbrand%2F2024-05%2F3760cec8-8747-45e8-b7c8-66782455b4a7_output.png%3Fformat%3Dwebp&w=1920&q=75",
        category: "1",
      ),
      productModel(
        name: "Sandwich Batata",
        description: "Fries, coleslaw, pickles, ketchup, garlic in Lebanese bread.",
        price: 17.0,
        imageUrl: "https://snoonu.com/_next/image?url=https%3A%2F%2Fimages.snoonu.com%2Fimages%2F4693e898-9de6-4988-9f20-f6be6abe8603_65e7276cd9095bbe56437bd9.jpg%3Fformat%3Dwebp&w=1920&q=75",
        category: "1",
      ),
      productModel(
        name: "Whole Chicken With Fries",
        description: "Whole chicken, fries, garlic, and magic sauce.",
        price: 35.0,
        imageUrl: "https://snoonu.com/_next/image?url=https%3A%2F%2Fimages.snoonu.com%2Fbrand%2F2024-08%2F9a42d417-69bf-487e-95d3-13b45079a438_output.png%3Fformat%3Dwebp&w=1920&q=75",
        category: "2",
      ),
      productModel(
        name: "Whole Chicken With Fries",
        description: "Whole chicken, fries, garlic, and magic sauce.",
        price: 35.0,
        imageUrl: "https://snoonu.com/_next/image?url=https%3A%2F%2Fimages.snoonu.com%2Fbrand%2F2024-08%2F9a42d417-69bf-487e-95d3-13b45079a438_output.png%3Fformat%3Dwebp&w=1920&q=75",
        category: "3",
      ),
      productModel(
        name: "Whole Chicken With Fries",
        description: "Whole chicken, fries, garlic, and magic sauce.",
        price: 35.0,
        imageUrl: "https://snoonu.com/_next/image?url=https%3A%2F%2Fimages.snoonu.com%2Fbrand%2F2024-08%2F9a42d417-69bf-487e-95d3-13b45079a438_output.png%3Fformat%3Dwebp&w=1920&q=75",
        category: "4",
      ),
      productModel(
        name: "Whole Chicken With Fries",
        description: "Whole chicken, fries, garlic, and magic sauce.",
        price: 35.0,
        imageUrl: "https://snoonu.com/_next/image?url=https%3A%2F%2Fimages.snoonu.com%2Fbrand%2F2024-08%2F9a42d417-69bf-487e-95d3-13b45079a438_output.png%3Fformat%3Dwebp&w=1920&q=75",
        category: "5",
      ),
      productModel(
        name: "Whole Chicken With Fries",
        description: "Whole chicken, fries, garlic, and magic sauce.",
        price: 35.0,
        imageUrl: "https://snoonu.com/_next/image?url=https%3A%2F%2Fimages.snoonu.com%2Fbrand%2F2024-08%2F9a42d417-69bf-487e-95d3-13b45079a438_output.png%3Fformat%3Dwebp&w=1920&q=75",
        category: "6",
      ),
      productModel(
        name: "Whole Chicken With Fries",
        description: "Whole chicken, fries, garlic, and magic sauce.",
        price: 35.0,
        imageUrl: "https://snoonu.com/_next/image?url=https%3A%2F%2Fimages.snoonu.com%2Fbrand%2F2024-08%2F9a42d417-69bf-487e-95d3-13b45079a438_output.png%3Fformat%3Dwebp&w=1920&q=75",
        category: "7",
      ),
      productModel(

        name: "Whole Chicken With Fries",
        description: "Whole chicken, fries, garlic, and magic sauce.",
        price: 35.0,
        imageUrl: "https://snoonu.com/_next/image?url=https%3A%2F%2Fimages.snoonu.com%2Fbrand%2F2024-08%2F9a42d417-69bf-487e-95d3-13b45079a438_output.png%3Fformat%3Dwebp&w=1920&q=75",
        category: "8",
      ),
      productModel(
        name: "Whole Chicken With Fries",
        description: "Whole chicken, fries, garlic, and magic sauce.",
        price: 35.0,
        imageUrl: "https://snoonu.com/_next/image?url=https%3A%2F%2Fimages.snoonu.com%2Fbrand%2F2024-08%2F9a42d417-69bf-487e-95d3-13b45079a438_output.png%3Fformat%3Dwebp&w=1920&q=75",
        category: "9",
      ),
    ]);
  }

  List<productModel> getItemsByCategory(String category) {
    return menuItems.where((item) => item.category == category).toList();
  }


}
