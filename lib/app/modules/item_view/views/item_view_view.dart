import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/item_view_controller.dart';

class ItemViewView extends GetView<ItemViewController> {
  const ItemViewView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          _buildSliverAppBar(),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildSearchBar(),
                _buildPromoBanner(),
                _buildSectionTitle("Popular Stores"),
                _buildPopularStoresGrid(),
                _buildSectionTitle("All Stores"),
                _buildPopularStoresGrid(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSliverAppBar() {
    return SliverAppBar(
      floating: false,
      pinned: true,
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
      title: Column(
        children: [
          Text("Groceries", style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: TextField(
        decoration: InputDecoration(
          hintText: "Search for stores or products",
          prefixIcon: Icon(Icons.search, color: Colors.grey),
          filled: true,
          fillColor: Colors.grey[200],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  Widget _buildPromoBanner() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.network(
          "https://snoonu.com/_next/image?url=https%3A%2F%2Fimages.snoonu.com%2Fbanner%2F2025-02%2F5b796d7d-a74b-4f51-983b-485014a15405_output.png&w=1920&q=75",
          height: 150,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Text(
        title,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildPopularStoresGrid() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Obx(() => GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 0.8,
        ),
        itemCount: controller.stores.length,
        itemBuilder: (context, index) {
          final store = controller.stores[index];
          return Column(
            children: [
            Container(
              width: 100, // Adjust size
              height: 60,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(12),
              ),
              child: ClipRRect(borderRadius: BorderRadius.circular(12),child: Image.network(store.image,fit: BoxFit.cover,)),
            ),
              SizedBox(height: 5),
              Text(store.name,textAlign: TextAlign.center,maxLines: 1, overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,)),
              Text(store.deliveryTime, style: TextStyle(color: Colors.grey, fontSize: 12)),
            ],
          );
        },
      )),
    );
  }
}
