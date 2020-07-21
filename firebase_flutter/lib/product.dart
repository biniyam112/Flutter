class Product {
  final String name;
  final String description;
  final int price;
  final String image;

  Product(this.name, this.description, this.price, this.image);

  factory Product.fromMap(Map<String, dynamic> data) {
    return Product(
        data['name'], data['description'], data['price'], data['image']);
  }
}
