import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/order_controller.dart';

class OrderView extends GetView<OrderController> {
  const OrderView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Orders'),
        centerTitle: true,

      ),
      body: _buildNoOrder()
    );
  }

  Widget _buildNoOrder() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Image Section
          Image.asset(
            'assets/images/Empty.png', // Replace with your image asset
            height: 200, // Adjust as needed
          ),
          SizedBox(height: 20), // Space between image and text

          // Bold Title
          Text(
            "No Current Orders",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 10), // Space between title and subtitle

          // Subtitle
          Text(
            "You currently have no active orders.",
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),
            textAlign: TextAlign.center, // Center the text
          ),
        ],
      ),
    );
  }
}
