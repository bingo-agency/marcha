class Product {
  final int id;
  final String name;
  final String description;
  final double price;
  final String thumbnail;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.thumbnail,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      price: json['price'],
      thumbnail: json['thumbnail'],
    );
  }
}
