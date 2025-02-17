import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart'; // Add this import for reverse geocoding

class LocationSelectionController extends GetxController {
  Rx<LatLng?> selectedLocation = Rx<LatLng?>(null);
  GoogleMapController? mapController;
  RxString address = ''.obs; // Store the address as a reactive string
  TextEditingController searchController = TextEditingController(); // Controller for the search text field

  @override
  void onInit() {
    super.onInit();
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    bool isLocationEnabled = await Geolocator.isLocationServiceEnabled();
    if (!isLocationEnabled) {
      print('Location services are disabled.');
      return;
    }

    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        print('Location permissions are denied');
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      print('Location permissions are permanently denied');
      return;
    }

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    selectedLocation.value = LatLng(position.latitude, position.longitude);
    await _updateAddress(position.latitude, position.longitude);
  }

  Future<void> _updateAddress(double latitude, double longitude) async {
    List<Placemark> placemarks = await placemarkFromCoordinates(latitude, longitude);
    if (placemarks.isNotEmpty) {
      Placemark placemark = placemarks.first;
      address.value = '${placemark.street}, ${placemark.locality}, ${placemark.country}';
      searchController.text = address.value; // Update the text field with the address
    }
  }

  void onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  void onCameraMove(CameraPosition position) {
    selectedLocation.value = position.target;
    _updateAddress(position.target.latitude, position.target.longitude);
  }
}
