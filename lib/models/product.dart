
class Product {
  // Basic information about each product.
  final String name;
  final String category;
  final String image;
  final double price;
  final double rating;
  final String description;

  // Every product must provide these details.
  const Product({
    required this.name,
    required this.category,
    required this.image,
    required this.price,
    required this.rating,
    required this.description,
  });
}
