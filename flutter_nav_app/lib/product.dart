class Product {
  final String name;
  final String description;
  final int price;
  final String image;
  final int rating;

  Product(this.name, this.description, this.price, this.image, this.rating);

  static List<Product> getProducts() {
    List<Product> items = <Product>[];

    items.add(Product(
      'iPhone',
      'this is the worst thing ever',
      100,
      'iphone.png',
      0,
    ));
    items.add(Product(
      'Floppy disk',
      'not used now or ever',
      700,
      'floppydisk.png',
      0,
    ));
    items.add(Product(
      'Samsung',
      'samsung tablet',
      1200,
      'tablet.png',
      0,
    ));
    items.add(Product(
      'Pixel',
      'better than i-phone',
      3000,
      'pixel.png',
      0,
    ));
    items.add(Product(
      'Pending',
      'dont know shit',
      0,
      'pendrive.png',
      0,
    ));
    items.add(Product(
      'Laptop',
      'best product ever',
      4000,
      'laptop.png',
      3,
    ));

    return items;
  }
}
