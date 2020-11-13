import 'package:flutter/material.dart';

import 'cart_items.dart';
import 'custom_app_bar.dart';
import 'food_description.dart';
import 'food_image.dart';
import 'food_title_with_price.dart';
import 'order_button.dart';

class Body extends StatelessWidget {
  const Body({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          CustomAppBar(),
          FoodImage(),
          SizedBox(height: 20),
          FoodTitleWithPrice(),
          SizedBox(height: 20),
          FoodDescription(),
          SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OrderButton(),
                CartItems(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
