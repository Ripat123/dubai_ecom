import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/cart_controller.dart';

class CartView extends GetView<CartController> {
  const CartView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
        centerTitle: true,
      ),
      body: _buildNoCart()
    );
  }

  Widget _buildNoCart(){
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Image Section
          Image.asset(
            'assets/images/Empty.png', // Replace with your image asset
            height: 200,
          ),
          SizedBox(height: 20), // Space between image and text

          // Title
          Text(
            "Your Cart Is Empty",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 10), // Space between title and subtitle

          // Subtitle
          Text(
            "Select goods from the catalog and add them to the basket for an order.",
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),
            textAlign: TextAlign.center, // Center-align text
          ),
        ],
      ),
    );
  }
}
