import 'package:scoped_model/scoped_model.dart';

class Product extends Model {
  final String name;
  final String description;
  final String image;
  final int price;
  int rating;

  Product(this.name, this.description, this.price, this.image, this.rating);
  factory Product.fromMap(Map<String, dynamic> json) {
    return Product(
      json['name'],
      json['description'],
      json['price'],
      json['image'],
      json['rating'],
    );
  }
  void updateRating(int myRating) {
    rating = myRating;
    notifyListeners();
  }

  static List<Product> getProducts() {
    List<Product> items = <Product>[];

    items.add(Product(
      'iPhone',
      'this is the worst thing ever',
      100,
      'assets/images/iphone.png',
      0,
    ));
    items.add(Product(
      'Floppy disk',
      'not used now or ever',
      700,
      'assets/images/floppydisk.png',
      0,
    ));
    items.add(Product(
      'Samsung',
      'samsung tablet',
      1200,
      'assets/images/tablet.png',
      0,
    ));
    items.add(Product(
      'Pixel',
      'better than i-phone',
      3000,
      'assets/images/pixel.png',
      0,
    ));
    items.add(Product(
      'Pending',
      'dont know shit',
      0,
      'assets/images/pending.png',
      0,
    ));
    items.add(Product(
      'Laptop',
      'best product ever',
      4000,
      'assets/images/laptop.png',
      0,
    ));

    return items;
  }
}
