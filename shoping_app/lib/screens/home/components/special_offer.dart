import 'package:flutter/material.dart';
import 'package:shoping_app/screens/home/components/special_offer_item_cart.dart';

import 'item_section_text.dart';

class SpecialOffers extends StatelessWidget {
  const SpecialOffers({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ItemSectionText(
          text: 'Special for you',
          press: () {},
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SpecialOfferItemsCard(
                imagePath: 'assets/images/Image Banner 2.png',
                category: 'SmartPhone',
                numOfItems: 10,
                press: () {},
              ),
              SpecialOfferItemsCard(
                imagePath: 'assets/images/Image Banner 3.png',
                category: 'SmartPhone',
                numOfItems: 120,
                press: () {},
              ),
              SpecialOfferItemsCard(
                imagePath: 'assets/images/Image Banner 2.png',
                category: 'SmartPhone',
                numOfItems: 10,
                press: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }
}
