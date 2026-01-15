class Product {
  final int product_id;
  final String thumbnail;
  final String title;
  final double price;
  final String description;

  Product({
    required this.product_id,
    required this.thumbnail,
    required this.title,
    required this.price,
    required this.description,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      product_id: json['id'],
      thumbnail: json['thumbnail'],
      title: json['title'],
      price: json['price'],
      description: json['description'],
    );
  }
}
