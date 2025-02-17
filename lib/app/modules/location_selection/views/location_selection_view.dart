import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../controllers/location_selection_controller.dart';

class LocationSelectionView extends GetView<LocationSelectionController> {
  const LocationSelectionView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Obx(() {
            if (controller.selectedLocation.value == null) {
              return Center(child: CircularProgressIndicator());
            }
            return GoogleMap(
              onMapCreated: controller.onMapCreated,
              initialCameraPosition: CameraPosition(
                target: controller.selectedLocation.value!,
                zoom: 15,
              ),
              onCameraMove: controller.onCameraMove,
              markers: {
                Marker(
                  markerId: MarkerId("selected-location"),
                  position: controller.selectedLocation.value!,
                ),
              },
            );
          }),

          Positioned(
            top: 50,
            left: 15,
            child: FloatingActionButton(
              backgroundColor: Colors.white,
              onPressed: () => Get.back(),
              child: Icon(Icons.arrow_back, color: Colors.black),
            ),
          ),

          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("Select location", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  SizedBox(height: 10),

                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      controller: controller.searchController, // Use the controller
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search),
                        hintText: "Search location",
                        border: InputBorder.none,
                      ),
                      onSubmitted: (value) {
                        // Implement location search logic (if needed)
                      },
                    ),
                  ),

                  SizedBox(height: 20),

                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      padding: EdgeInsets.symmetric(vertical: 14, horizontal: 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {
                      if (controller.selectedLocation.value != null) {
                        Get.back(result: controller.selectedLocation.value);
                      }
                    },
                    child: Text("Confirm location", style: TextStyle(fontSize: 16, color: Colors.white)),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
