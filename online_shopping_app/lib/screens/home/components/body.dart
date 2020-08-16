import 'package:flutter/material.dart';
import 'package:online_shopping_app/constants.dart';
import 'package:online_shopping_app/models/product.dart';
import 'package:online_shopping_app/screens/details/details.dart';
import 'package:online_shopping_app/screens/home/components/categories.dart';
import 'package:online_shopping_app/screens/home/components/item_card.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: Text(
            "Women",
            style: Theme.of(context)
                .textTheme
                .headline5
                .copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        Categories(),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: GridView.builder(
              padding: EdgeInsets.symmetric(vertical: 20),
              itemCount: products.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: kDefaultPadding / 2,
                crossAxisSpacing: kDefaultPadding,
                childAspectRatio: 0.7,
              ),
              itemBuilder: (context, index) => ItemCard(
                product: products[index],
                onPress: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailsScreen(
                      product: products[index],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
