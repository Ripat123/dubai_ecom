import 'package:dubai_ecocm/app/widget/item_lay.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {

  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildDeliveryAddress(),
            _buildSearchCard(),
            _buildItemSection()
          ],
        ),
      ),
    );
  }

  Widget _buildDeliveryAddress() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
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
          padding: const EdgeInsets.only(right: 10, top: 10),
          child: IconButton.outlined(
            onPressed: () {},
            icon: const Icon(Icons.favorite_border_rounded),
          ),
        ),
      ],
    );
  }

  Widget _buildSearchCard() {
    return Card(
      margin: const EdgeInsets.all(10),
      elevation: 0,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: const BorderSide(color: Colors.black12),
      ),
      child: InkWell(
        onTap: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            SizedBox(height: 30),
            Icon(Icons.search_rounded, size: 19, color: Colors.black87),
            SizedBox(width: 5),
            Text('Search your needs',
                style: TextStyle(fontSize: 13, color: Colors.black87)),
          ],
        ),
      ),
    );
  }

  Widget _buildItemSection() {
    final DashboardController controller = Get.put(DashboardController());
    return Obx(() {
      if (controller.isLoading.value) {
        return const Center(child: CircularProgressIndicator(),);
      } else if(controller.items.isEmpty) {
        return const Center(child: Text("No Items Available"));
      } else {print("ok ");
        return GridView.builder(
          padding: EdgeInsets.all(8),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, crossAxisSpacing: 10, mainAxisSpacing: 10,childAspectRatio: 3/2),
          itemCount: controller.items.length,
          itemBuilder: (context, index) {
            final item = controller.items[index];

            return ItemLay(model: item);
          },);
      }
    });
  }
}