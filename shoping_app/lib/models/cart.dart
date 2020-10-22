import 'package:shoping_app/models/products.dart';

import 'package:flutter/material.dart';

class Cart {
  final Product product;
  final int numberOfItems;

  Cart({
    @required this.numberOfItems,
    @required this.product,
  });
}

List<Cart> carts = [
  Cart(product: demoProducts[0], numberOfItems: 2),
  Cart(product: demoProducts[1], numberOfItems: 5),
  Cart(product: demoProducts[2], numberOfItems: 1),
  Cart(product: demoProducts[3], numberOfItems: 2),
];
