class Product {
  final String id;
  final String name;
  final double price;
  final String imagePath;
  final String category;
  final String description;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.imagePath,
    required this.category,
    required this.description,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      price: (json['price'] ?? 0.0).toDouble(),
      imagePath: json['imagePath'] ?? '',
      category: json['category'] ?? '',
      description: json['description'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'imagePath': imagePath,
      'category': category,
      'description': description,
    };
  }
}

class Category {
  final String id;
  final String name;
  final String iconPath;
  final int productCount;

  Category({
    required this.id,
    required this.name,
    required this.iconPath,
    required this.productCount,
  });
}

