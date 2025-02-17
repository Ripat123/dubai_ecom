import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/food_detail_bottom_sheet_controller.dart';

class FoodDetailBottomSheetView
    extends GetView<FoodDetailBottomSheetController> {

  @override
  final FoodDetailBottomSheetController controller = Get.put(FoodDetailBottomSheetController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DraggableScrollableSheet(
        initialChildSize: 0.97, // Fully expanded
        minChildSize: 0.5, // Minimum height when dragged down
        maxChildSize: 0.97, // Full-screen height
        builder: (context, scrollController) {
          return Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            child: Column(
              children: [
                _buildHeader(),
                Expanded(
                  child: SingleChildScrollView(
                    controller: scrollController, // Enables scrolling
                    child: _buildContent(context),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton.filled(
            icon: Icon(Icons.close,color: Colors.black,),
            onPressed: () => Get.back(),
            style: IconButton.styleFrom(backgroundColor: Colors.blueGrey.shade50),
          ),
          Row(
            children: [
              IconButton.filled(
                icon: Icon(Icons.favorite_border,color: Colors.black,),
                onPressed: () {
                },
                style: IconButton.styleFrom(backgroundColor: Colors.blueGrey.shade50),
              ),
              SizedBox(width: 10),
              IconButton.filled(
                icon: Icon(Icons.share,color: Colors.black,),
                onPressed: () {
                },
                style: IconButton.styleFrom(backgroundColor: Colors.blueGrey.shade50),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              "https://snoonu.com/_next/image?url=https%3A%2F%2Fimages.snoonu.com%2Ftest%2Fheaderimage_new%2FibSMDSIxNt.jpg%3Fformat%3Dwebp&w=1920&q=75", // Replace with actual image URL
              width: double.infinity,
              height: 220,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Daggous", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              _buildRestaurantInfo(),
              SizedBox(height: 10),
              Text(
                "Traditional Spicy Sauce Made From Tomatoes, Peppers, And Garlic.",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              SizedBox(height: 20),
              _buildSpecialRequestField(),
              SizedBox(height: 20),
              _buildQuantityAndCartButton(context),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildRestaurantInfo() {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Al Katem", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          Text("47 mins", style: TextStyle(fontSize: 14, color: Colors.grey)),
        ],
      ),
    );
  }

  Widget _buildSpecialRequestField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Special Request", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        SizedBox(height: 5),
        TextField(
          decoration: InputDecoration(
            hintText: "e.g. skip on some ingredients",
            filled: true,
            fillColor: Colors.grey.shade100,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
          ),
        ),
      ],
    );
  }

  Widget _buildQuantityAndCartButton(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            _quantityButton(Icons.remove, controller.decreaseQuantity),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Obx(() => Text(
                "${controller.quantity.value}",
                style: TextStyle(fontSize: 18),
              )),
            ),
            _quantityButton(Icons.add, controller.increaseQuantity),
          ],
        ),
        // Use Flexible to ensure the Add to Cart button doesn't overflow
        Flexible(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            onPressed: () {
              controller.addToCart();
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 13),
              child: Text(
                "Add to Cart",
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width > 360 ? 16 : 14, // Adjust font size based on screen width
                  color: Colors.white,fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _quantityButton(IconData icon, VoidCallback onPressed) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.grey.shade200,
      ),
      child: IconButton(icon: Icon(icon), onPressed: onPressed),
    );
  }
}
