import 'package:dubai_ecocm/app/routes/app_pages.dart';
import 'package:dubai_ecocm/app/widget/ItemCard_lay.dart';
import 'package:dubai_ecocm/app/widget/banner_lay.dart';
import 'package:dubai_ecocm/app/widget/foodItem_lay.dart';
import 'package:dubai_ecocm/app/widget/item_lay.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildDeliveryAddress(),
              _buildSearchCard(),
              _buildItemSection(),
              _buildBannerSection(),

              _buildProductSection()
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDeliveryAddress() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Delivering to',
                style: TextStyle(fontSize: 13, color: Colors.black54),
              ),
              Text(
                'Kuril, Dhaka, Bangladesh',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 10, top: 20),
          child: IconButton.filled(
            onPressed: () {
              Get.toNamed(Routes.LOCATION_SELECTION);
            },
            icon: const Icon(Icons.favorite_border_rounded,color: Colors.black87,),
            style: IconButton.styleFrom(
              backgroundColor: Colors.blueGrey.shade50, // Set your desired background color
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSearchCard() {
    return Card(
      margin: const EdgeInsets.all(10),
      elevation: 0,
      color: Colors.blueGrey.shade50,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: InkWell(
        onTap: () {
          Get.toNamed(Routes.SEARCH);
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            SizedBox(height: 48),
            Icon(Icons.search_rounded, size: 21, color: Colors.black54),
            SizedBox(width: 5),
            Text('Search your needs',
                style: TextStyle(fontSize: 14, color: Colors.black54)),
          ],
        ),
      ),
    );
  }

  Widget _buildItemSection() {
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

                return ItemLay(model: item);
              },
            ),
          );
        },
        );
      }
    });
  }

  Widget _buildBannerSection() {
    return Obx(() {
      if (controller.isBannerLoading.value) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else if (controller.banners.isEmpty) {
        return const SizedBox();
      } else {
        return SizedBox(
          height: 140,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: controller.banners.length,
            itemBuilder: (context, index) {
              final banner = controller.banners[index];
              return BannerLay(banner);
            },
          ),
        );
      }
    });
  }

  Widget _buildProductSection() {
    return Container(
      margin: EdgeInsets.only(top: 20),
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.blueGrey.shade50,
          borderRadius: BorderRadius.circular(20)
      ),
      child: Column(
        children: [
          SizedBox(height: 25,),
          _buildFoodItemSection(),
          SizedBox(height: 15,),
          _buildItemCardSection()
        ],
      ),
    );
  }

  Widget _buildFoodItemSection() {
    return Obx(() {
      if (controller.isFoodLoading.value) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else if (controller.foods.isEmpty) {
        return const SizedBox();
      } else {
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
      }
    });
  }

  Widget _buildItemCardSection() {
    return Obx(() {
      if (controller.isLoading.value) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else if (controller.items.isEmpty) {
        return const SizedBox();
      }else {
        return LayoutBuilder(builder: (context, constraints) {
          // Calculate crossAxisCount based on screen width
          int crossAxisCount = (constraints.maxWidth ~/ 280).toInt();
          crossAxisCount = crossAxisCount < 1 ? 1 : crossAxisCount;

          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.all(8),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 0,
                childAspectRatio: 1.3
              ),
              itemCount: 3,
              itemBuilder: (context, index) {
                //final item = controller.items[index];

                return ItemCardLay(
                    imageUrl: 'https://images.immediate.co.uk/production/volatile/sites/30/2020/08/chorizo-mozarella-gnocchi-bake-cropped-9ab73a3.jpg',
                    discountBadge: '30% Off',
                    title: 'Sample Text',
                    rating: 4.0,
                    categories: 'Arabic,Italian,etc',
                    deliveryTime: '30 - 35 Min');
              },
            ),
          );
        },
        );
      }
    });
  }

}

