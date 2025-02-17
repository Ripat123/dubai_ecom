import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/cart_controller.dart';

class CartView extends GetView<CartController> {
  const CartView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () {},
        ),
        title: Text('Cart', style: TextStyle(fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
            icon: Icon(Icons.delete_outline),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 16),
              children: [
                _buildStoreInfo(),
                Divider(),
                _buildOrderSummary(),
                Divider(),
              ],
            ),
          ),
          _buildCheckoutSection(),
        ],
      ),
    );
  }

  Widget _buildStoreInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 8),
        Text('Snoomart', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold,color: Colors.black)),
        ListTile(
          leading: Icon(Icons.location_on),
          title: Text('Other', style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black)),
          subtitle: Text('Dubai Studio'),
        ),
        ListTile(
          leading: Icon(Icons.access_time),
          title: Text('in 21 mins', style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black)),
        ),
      ],
    );
  }

  Widget _buildOrderSummary() {
    // final CartController controller = Get.find<CartController>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        const Text('Your Order',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Colors.black)),
        const SizedBox(height: 8),
        Obx(() => ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: controller.cartItems.length,
          itemBuilder: (context, index) {
            final item = controller.cartItems[index];

            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      item.imageUrl,
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(item.title,
                            style: const TextStyle(fontWeight: FontWeight.bold)),
                        const Text('Add Special Request',
                            style: TextStyle(color: Colors.grey)),
                        Row(
                          children: [
                            Text('${item.price} QR',
                                style: const TextStyle(fontWeight: FontWeight.bold)),
                            const SizedBox(width: 8),
                            Text('39 QR', // You can add original price logic
                                style: const TextStyle(
                                    decoration: TextDecoration.lineThrough,
                                    color: Colors.grey)),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.remove_circle_outline, color: Colors.black),
                        onPressed: () {
                          controller.decreaseQuantity(index);
                        },
                      ),
                      Text('${item.quantity}', style: const TextStyle(fontSize: 16)),
                      IconButton(
                        icon: const Icon(Icons.add_circle_outline, color: Colors.black),
                        onPressed: () {
                          controller.increaseQuantity(index);
                        },
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        )),
      ],
    );
  }


  Widget _buildCheckoutSection() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 8)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Delivery fee', style: TextStyle(fontSize: 16)),
              Text('10 QR', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ],
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Total', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Text('36.5 QR', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ],
          ),
          SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: Colors.black,
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
              ),
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween, // Ensures text & icon are spaced out
                children: [
                  const SizedBox(width: 24), // Empty space to balance alignment
                  const Text(
                    'Go to Checkout',
                    style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  const Icon(Icons.arrow_forward_ios, color: Colors.white, size: 18), // Add icon here
                ],
              ),
            )

          ),
        ],
      ),
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
