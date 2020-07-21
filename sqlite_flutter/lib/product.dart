class Product {
  final int id;
  final String name;
  final String description;
  final int price;
  final String image;

  static final columns = ['id', 'name', 'description', 'price', 'image'];

  Product(this.id, this.name, this.description, this.price, this.image);

  factory Product.fromMap(Map<String, dynamic> data) {
    return Product(data['id'], data['name'], data['description'], data['price'],
        data['image']);
  }

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "description": description,
        "price": price,
        "image": image
      };
}
