import 'package:dubai_ecocm/app/modules/search/controllers/search_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../widget/foodItem_lay.dart';


class SearchView extends GetView<SearchingController> {
  const SearchView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Get.back(),
        ),
        title: Container(
          height: 40,
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(20),
          ),
          child: TextField(
            decoration: InputDecoration(
              hintText: "Search",
              border: InputBorder.none,
              prefixIcon: Icon(Icons.search, color: Colors.grey),
              contentPadding: EdgeInsets.symmetric(vertical: 10),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Trending Search", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Obx(() => Wrap(
              spacing: 10,
              runSpacing: 10,
              children: controller.trendingSearches.map((search) {
                return Chip(
                  label: Text(search.title),
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20), side: BorderSide(color: Colors.grey.shade300)),
                );
              }).toList(),
            )),
            SizedBox(height: 20),
            Text("Cuisines", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 15),
            _buildTrendingCuisines(),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  Widget _buildTrendingCuisines() {
    return Obx(() {
        return SizedBox(
          height: 100,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: controller.foods.length,
            itemBuilder: (context, index) {
              final food = controller.foods[index];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: FoodItemLay(food),
              );
            },
          ),
        );

    });
  }

}
