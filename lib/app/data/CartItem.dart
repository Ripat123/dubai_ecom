class CartItem {
  String id;
  String title;
  String imageUrl;
  double price;
  int quantity;

  CartItem({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.price,
    this.quantity = 1,
  });
}