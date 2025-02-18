import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/market_controller.dart';

class MarketView extends GetView<MarketController> {
  const MarketView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Snoonu Market', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.favorite_border),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search in Snoonu Market',
                  prefixIcon: Icon(Icons.search),
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            _buildCategoryGrid(),
            _buildSlider(),
            _buildTabSelection(),
            _buildProductSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryGrid() {
    List<Map<String, String>> categories = [
      {'title': 'Heartfelt Gifts', 'icon': 'assets/gift.png'},
      {'title': 'Electronics', 'icon': 'assets/electronics.png'},
      {'title': 'Pets', 'icon': 'assets/pets.png'},
      {'title': 'Home & Garden', 'icon': 'assets/home.png'},
      {'title': 'Toys, Kids & Baby', 'icon': 'assets/toys.png'},
      {'title': 'Clothes & Accessories', 'icon': 'assets/clothes.png'},
      {'title': 'Health & Beauty', 'icon': 'assets/health.png'},
      {'title': 'More', 'icon': 'assets/more.png'},
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          childAspectRatio: 0.8,
        ),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              CircleAvatar(
                backgroundColor: Colors.grey[200],
                radius: 30,
                child: Image.asset(categories[index]['icon']!, height: 40),
              ),
              SizedBox(height: 5),
              Text(
                categories[index]['title']!,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildSlider() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Container(
        height: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(
            image: NetworkImage('assets/slider.png'),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget _buildTabSelection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
      child: Obx(
            () => Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildTabItem('For You', 0),
            _buildTabItem('Popular', 1),
          ],
        ),
      ),
    );
  }

  Widget _buildTabItem(String title, int index) {
    return GestureDetector(
      onTap: () => controller.selectedTab.value = index,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        decoration: BoxDecoration(
          color: controller.selectedTab.value == index ? Colors.black : Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.black),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: controller.selectedTab.value == index ? Colors.white : Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildProductSection() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Ramadan My Kitchen 🌙',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          SizedBox(height: 10),
          Container(
            height: 120,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, index) {
                return Container(
                  width: 100,
                  margin: EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[200],
                  ),
                  child: Icon(Icons.kitchen, size: 40),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
