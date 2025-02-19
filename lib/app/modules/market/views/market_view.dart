import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../../../widget/item_lay.dart';
import '../../../widget/productCard.dart';
import '../controllers/market_controller.dart';

class MarketView extends GetView<MarketController> {
  const MarketView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Market', style: TextStyle(fontWeight: FontWeight.bold)),
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
                  hintText: 'Search in Market',
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
    return Obx(() {
      if (controller.isLoading.value) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else if (controller.items.isEmpty) {
        return const Center(child: Text("No Items Available"));
      } else {
        return LayoutBuilder(builder: (context, constraints) {
          // Calculate crossAxisCount based on screen width
          int crossAxisCount = (constraints.maxWidth ~/ 90).toInt();
          crossAxisCount = crossAxisCount < 2 ? 2 : crossAxisCount;

          return SizedBox(
            height: (controller.items.length / crossAxisCount).ceil() * 120.0,
            child: GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.all(8),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.8
              ),
              itemCount: controller.items.length,
              itemBuilder: (context, index) {
                final item = controller.items[index];

                return ItemLay(model: item,ontap: () => Get.toNamed(Routes.ITEM_VIEW),);
              },
            ),
          );
        },
        );
      }
    });
  }


  Widget _buildSlider() {
    return Obx(() => Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 150.0,
            autoPlay: true,
            enlargeCenterPage: true,
            viewportFraction: 0.9,
            onPageChanged: (index, reason) {
              controller.currentIndex.value = index;
            },
          ),
          items: controller.sliderImages.map((imagePath) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(22),
              child: Image.network(imagePath, fit: BoxFit.cover, width: double.infinity),
            );
          }).toList(),
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            controller.sliderImages.length,
                (index) => AnimatedContainer(
              duration: Duration(milliseconds: 300),
              margin: EdgeInsets.symmetric(horizontal: 4.0),
              width: controller.currentIndex.value == index ? 20 : 8,
              height: 8,
              decoration: BoxDecoration(
                color: controller.currentIndex.value == index ? Colors.black : Colors.grey,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ),
      ],
    ));
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
          Text(
            'Ramadan My Kitchen',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          SizedBox(height: 10),
          Obx(() {
            return GridView.builder(
              itemCount: controller.productList.length,
              shrinkWrap: true, // Important to avoid infinite height issues
              physics: NeverScrollableScrollPhysics(), // Avoid nested scrolling
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.75,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
              ),
              itemBuilder: (context, index) {
                var product = controller.productList[index];
                return ProductCard(product: product, index: index);
              },
            );
          }),
        ],
      ),
    );
  }



}
