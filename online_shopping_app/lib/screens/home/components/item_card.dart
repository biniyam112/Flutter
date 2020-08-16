import 'package:flutter/material.dart';
import 'package:online_shopping_app/constants.dart';
import 'package:online_shopping_app/models/product.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({
    Key key,
    this.product,
    this.onPress,
  }) : super(key: key);
  final Product product;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onPress,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: product.color,
              borderRadius: BorderRadius.circular(20),
            ),
            child: SizedBox(
              height: size.width / 2 - 20,
              width: size.width / 2,
              child: Hero(
                tag: '${product.id}',
                child: Image.asset(
                  product.image,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: kDefaultPadding / 4),
            child: Text(
              product.title,
              style: TextStyle(
                color: kTextLightColor,
              ),
            ),
          ),
          Text(
            '\$${product.price.toString()}',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
