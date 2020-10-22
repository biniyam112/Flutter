import 'package:flutter/material.dart';
import 'package:shoping_app/models/cart.dart';
import 'package:shoping_app/screens/cart/components/body.dart';

import 'components/check_out_card.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key key}) : super(key: key);

  static String routeName = '/cart_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Body(),
      bottomNavigationBar: CheckOutCard(),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Added to cart',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          Text(
            '${carts.length} items',
            style: Theme.of(context).textTheme.caption,
          ),
        ],
      ),
      centerTitle: true,
    );
  }
}
