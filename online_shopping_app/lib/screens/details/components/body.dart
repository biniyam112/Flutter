import 'package:flutter/material.dart';
import 'package:online_shopping_app/constants.dart';
import 'package:online_shopping_app/models/product.dart';
import 'package:online_shopping_app/screens/details/components/add_to_cart.dart';
import 'package:online_shopping_app/screens/details/components/color_and_size.dart';
import 'package:online_shopping_app/screens/details/components/counter_with_fav_button.dart';
import 'package:online_shopping_app/screens/details/components/product_description.dart';
import 'package:online_shopping_app/screens/details/components/product_name_plus_picture.dart';

class Body extends StatelessWidget {
  const Body({Key key, this.product}) : super(key: key);
  final Product product;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: size.height,
            child: Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(top: size.height * .3),
                  padding: EdgeInsets.only(
                    top: size.height * .12,
                    right: kDefaultPadding,
                    left: kDefaultPadding,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(24),
                    ),
                  ),
                  child: Column(
                    children: [
                      ColorAndSize(product: product),
                      SizedBox(height: kDefaultPadding / 2),
                      ProductDescription(product: product),
                      SizedBox(height: kDefaultPadding / 2),
                      CounterWithFavButton(),
                      AddToCart(product: product)
                    ],
                  ),
                ),
                ProductNamePlusPicture(product: product),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
