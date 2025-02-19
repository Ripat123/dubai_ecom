class productModel {
  final String name;
  final String description;
  final String price;
  final String imageUrl;
  final String category;
  final String oldPrice;
  final String discount;
  final String tag;
  final bool isFavorite;

  productModel({
    required this.imageUrl,
    required this.name,
    required this.price,
    this.oldPrice = '',
    this.discount = '',
    this.category = '',
    this.description = '',
    this.tag = '',
    this.isFavorite = false,
  });
}


