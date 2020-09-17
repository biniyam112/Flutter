import 'package:flutter/material.dart';

import '../../../size_config.dart';
import 'icon_button_with_counter.dart';
import 'search_field.dart';

class CustomAppBarItems extends StatelessWidget {
  const CustomAppBarItems({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(20),
        vertical: getProportionateScreenHeight(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SearchField(
            hintText: 'Search Product',
          ),
          IconbuttonWithCounter(
            iconPath: 'assets/icons/Cart Icon.svg',
            press: () {},
          ),
          IconbuttonWithCounter(
            iconPath: 'assets/icons/Bell.svg',
            numOfNotification: 13,
            press: () {},
          ),
        ],
      ),
    );
  }
}
