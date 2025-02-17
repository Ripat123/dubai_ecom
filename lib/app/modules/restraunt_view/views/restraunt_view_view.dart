import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../data/category.dart';
import '../../food_detail_bottom_sheet/views/food_detail_bottom_sheet_view.dart';
import '../controllers/restraunt_view_controller.dart';

class RestrauntViewView extends GetView<RestrauntViewController> {
  const RestrauntViewView({super.key});
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: controller.categories.length,
      child: Scaffold(backgroundColor: Colors.white,
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverAppBar(
              expandedHeight: 215.0,
              floating: false,
              pinned: true,
              backgroundColor: Colors.white,
              flexibleSpace: FlexibleSpaceBar(
                background: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.network("https://snoonu.com/_next/image?url=%2F_next%2Fstatic%2Fmedia%2Foutdoor_adventures.9d55419f.jpg&w=640&q=75", fit: BoxFit.cover),
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.black.withOpacity(0.1),
                            Colors.black.withOpacity(0.3),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              leading: Padding(
                padding: const EdgeInsets.only(left: 10,top: 8,bottom: 8), // Adjust left padding
                child: SizedBox(
                  width: 40, // Ensure the back button is smaller
                  height: 40,
                  child: _buildIconButton(Icons.arrow_back, () => Get.back()),
                ),
              ),
              actions: [
                _buildIconButton(Icons.search, () {}),
                SizedBox(width: 10),
                _buildIconButton(Icons.favorite_border, () {}),
                SizedBox(width: 10),
                _buildIconButton(Icons.more_vert, () {}),
                SizedBox(width: 10),
              ],
            ),
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildRestaurantDetails(),
                  const SizedBox(height: 8),
                  _buildRestOpt(),
                  const SizedBox(height: 16),
                  _buildBestSellingSection(),
                  const SizedBox(height: 16),
                ],
              )
            ),

            SliverPersistentHeader(
                delegate: _SliverCategoryTabDelegate(
                    categories: controller.categories,
                    onCategorySelected: (index) {
                        controller.tabController.animateTo(index);
                    },
                ),
                pinned: true,
            ),

          ],
          body: _buildCustomTab()
        ),
        bottomNavigationBar: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: FilledButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                padding: EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              child: Text("View Basket - 0.00 QAR", style: TextStyle(color: Colors.white, fontSize: 16)),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCustomTab(){
    return TabBarView(
      controller: controller.tabController,
      children: controller.categories.map((category) {
        return Obx(() {
          var items = controller.getItemsByCategory(category.itemId);
          return ListView.builder(
            padding: EdgeInsets.all(16),
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];
              return Card(
                margin: EdgeInsets.symmetric(vertical: 8),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                elevation: 0,
                color: Colors.blueGrey.shade50,
                child: ListTile(
                  leading: ClipRRect(
                    child: Image.network(item.imageUrl, width: 50, height: 50, fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  title: Text(item.name, style: TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text(item.description, maxLines: 2, overflow: TextOverflow.ellipsis),
                  trailing: Text("QAR ${item.price}", style: TextStyle(fontWeight: FontWeight.bold)),
                ),
              );
            },
          );
        });
      }).toList(),
    );
  }

  /// **Restaurant Details Section**
  Widget _buildRestaurantDetails() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Shake Shack",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Icon(Icons.star, color: Colors.amber, size: 18),
              const SizedBox(width: 4),
              Text("4.6", style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(width: 4),
              Text("(99+)", style: TextStyle(color: Colors.grey)),
              const SizedBox(width: 10),
              Text("\$\$\$", style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(width: 10),
              Text("American, Fast Food", style: TextStyle(color: Colors.grey)),
            ],
          ),
        ],
      ),
    );
  }

  /// **Best Selling Items Section**
  Widget _buildBestSellingSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Best Selling",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 160, // Increased height to fit rounded images and price buttons
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: controller.bestSellingList.length,
              itemBuilder: (context, index) {
                var item = controller.bestSellingList[index];
                return _buildBestSellingItem(item.image, item.name, item.price);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBestSellingItem(String image, String name, String price) {
    return InkWell(
      onTap: () {
        Get.bottomSheet(FoodDetailBottomSheetView(), isScrollControlled: true,backgroundColor: Colors.transparent,);
      },
      child: Container(
        decoration: BoxDecoration(color: Colors.blueGrey.shade50,borderRadius: BorderRadius.circular(15)),
        width: 120,
        margin: const EdgeInsets.only(right: 10),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(image, height: 80, width: 80, fit: BoxFit.cover),
            ),
            const SizedBox(height: 6),
            Text(name, style: TextStyle(fontWeight: FontWeight.bold), textAlign: TextAlign.center),
            const SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("$price QR", style: TextStyle(fontSize: 14, color: Colors.black)),
                const SizedBox(width: 5),
                Container(
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Icon(Icons.add, color: Colors.black, size: 16),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRestOpt(){
    return // Additional Options Section
      Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            ListTile(
              leading: Icon(Icons.delivery_dining,color: Colors.black,),
              title: Text("By Snoonu",style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold),),
              subtitle: Text("Dubai Shopping Center WLL"),
              trailing: Icon(Icons.arrow_forward_ios, size: 16),
            ),
            Divider(height: 1,),
            ListTile(
              leading: Icon(Icons.access_time,color: Colors.black,),
              title: Text("In 31 mins",style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold),),
              subtitle: Text("Tap to schedule order"),
              trailing: Icon(Icons.arrow_forward_ios, size: 16),
            ),
          ],
        ),
      );
  }

  Widget _buildIconButton(IconData icon, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: 40, // Adjust size
        height: 40,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Icon(icon, color: Colors.black, size: 22),
        ),
      ),
    );
  }

  // Widget _buildCategoryGrid() {
  //   return Padding(
  //     padding: const EdgeInsets.all(8.0),
  //     child: GridView.builder(
  //       shrinkWrap: true,
  //       physics: NeverScrollableScrollPhysics(),
  //       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
  //         crossAxisCount: 5,
  //         childAspectRatio: 0.8,
  //         crossAxisSpacing: 7,
  //         mainAxisSpacing: 7,
  //       ),
  //       itemCount: controller.categories.length,
  //       itemBuilder: (context, index) {
  //         final category = controller.categories[index];
  //         return GestureDetector(
  //           onTap: () {
  //             controller.setSelectedCategory(category);
  //           },
  //           child: Column(
  //             children: [
  //               ClipRRect(
  //                 borderRadius: BorderRadius.circular(10),
  //                 child: Image.network(
  //                   category.imageUrl,
  //                   height: 50,
  //                   width: 50,
  //                   fit: BoxFit.cover,
  //                 ),
  //               ),
  //               SizedBox(height: 5),
  //               Text(
  //                 category.title,
  //                 style: TextStyle(fontSize: 13),
  //                 textAlign: TextAlign.center,
  //                 overflow: TextOverflow.ellipsis,
  //               ),
  //             ],
  //           ),
  //         );
  //       },
  //     ),
  //   );
  // }

  // Widget _buildCategoryTabViews() {
  //   return Obx(() {
  //     var selectedCategory = controller.selectedCategory;
  //     var items = controller.getItemsByCategory(selectedCategory.value!.title);
  //     return ListView.builder(
  //       padding: EdgeInsets.all(12),
  //       itemCount: items.length,
  //       itemBuilder: (context, index) {
  //         final item = items[index];
  //         return Card(
  //           margin: EdgeInsets.symmetric(vertical: 5),
  //           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
  //           elevation: 0,
  //           color: Colors.blueGrey.shade50,
  //           child: ListTile(
  //             leading: ClipRRect(
  //               borderRadius: BorderRadius.circular(15),
  //               child: Image.network(
  //                 item.imageUrl,
  //                 width: 50,
  //                 height: 50,
  //                 fit: BoxFit.cover,
  //               ),
  //             ),
  //             title: Text(item.name, style: TextStyle(fontWeight: FontWeight.bold)),
  //             subtitle: Text(item.description, maxLines: 2, overflow: TextOverflow.ellipsis),
  //             trailing: Text("QAR ${item.price}", style: TextStyle(fontWeight: FontWeight.bold)),
  //           ),
  //         );
  //       },
  //     );
  //   });
  // }

}


class _SliverCategoryTabDelegate extends SliverPersistentHeaderDelegate {
  final List<CategoryModel> categories;
  final Function(int) onCategorySelected;
  int selectedIndex; // Store the selected category index

  _SliverCategoryTabDelegate({
    required this.categories,
    required this.onCategorySelected,
    this.selectedIndex = 0, // Default selected index
  });

  @override
  double get minExtent => 180.0;
  @override
  double get maxExtent => 180.0;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.white,
      child: GridView.builder(
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: 4.0,
          mainAxisSpacing: 4.0,
        ),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          final bool isSelected = index == selectedIndex; // Check if selected

          return Column(
            children: [
              InkWell(
                onTap: () {
                  onCategorySelected(index);
                  selectedIndex = index; // Update selected index
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: isSelected ? Colors.purpleAccent.shade100 : Colors.blueGrey.shade50,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: isSelected ? Colors.purpleAccent : Colors.transparent,
                      width: 2, // Add border to highlight selection
                    ),
                  ),
                  padding: const EdgeInsets.all(8),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.network(
                      category.imageUrl,
                      width: 34,
                      height: 34,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 3),
              Text(
                category.title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal, // Highlight text if selected
                  color: isSelected ? Colors.purpleAccent : Colors.black87,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          );
        },
      ),
    );
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true; // Rebuild when selection changes
  }
}


