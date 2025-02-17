import 'package:get/get.dart';

import '../../../data/CartItem.dart';

class CartController extends GetxController {
  var cartItems = <CartItem>[].obs; // List of items in the cart
  var deliveryFee = 10.0.obs; // Delivery fee
  var appliedVoucher = ''.obs; // Applied voucher code

  // Calculate total price dynamically
  double get totalPrice {
    double itemTotal =
        cartItems.fold(0, (sum, item) => sum + (item.price * item.quantity));
    return itemTotal + deliveryFee.value;
  }

  // Add item to cart
  void addItem(CartItem item) {
    var index = cartItems.indexWhere((e) => e.id == item.id);
    if (index >= 0) {
      cartItems[index].quantity++;
    } else {
      cartItems.add(item);
    }
    update();
  }

  // Remove item from cart
  void removeItem(CartItem item) {
    cartItems.removeWhere((e) => e.id == item.id);
    update();
  }

  // Increase item quantity
  void increaseQuantity(int index) {
    cartItems[index].quantity++;
    update();
  }

  // Decrease item quantity
  void decreaseQuantity(int index) {
    if (cartItems[index].quantity > 1) {
      cartItems[index].quantity--;
    } else {
      cartItems.removeAt(index);
    }
    update();
  }

  // Apply a voucher code
  void applyVoucher(String code) {
    appliedVoucher.value = code;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    addItem(CartItem(
        id: "1",
        title: "Dulci Light Sweetener Zero Calories 200G",
        imageUrl:
            "https://snoonu.com/_next/image?url=https%3A%2F%2Fimages.snoonu.com%2Fbrand%2F2024-08%2F9a42d417-69bf-487e-95d3-13b45079a438_output.png%3Fformat%3Dwebp&w=1920&q=75",
        price: 39));
    addItem(CartItem(
        id: "2",
        title: "Dulci Light Sweetener Zero Calories 200G",
        imageUrl:
        "https://snoonu.com/_next/image?url=https%3A%2F%2Fimages.snoonu.com%2Fimages%2F4693e898-9de6-4988-9f20-f6be6abe8603_65e7276cd9095bbe56437bd9.jpg%3Fformat%3Dwebp&w=1920&q=75",
        price: 26));
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
