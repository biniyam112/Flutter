import 'package:flutter/material.dart';
import 'package:shoping_app/size_config.dart';

import 'categories.dart';
import 'custom_appbar_items.dart';
import 'free_offers_banner.dart';
import 'popular_products.dart';
import 'special_offer.dart';

class Body extends StatelessWidget {
  const Body({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            CustomAppBarItems(),
            FreeOffersBanner(),
            SizedBox(height: getProportionateScreenHeight(10)),
            Categories(),
            SizedBox(height: getProportionateScreenHeight(10)),
            SpecialOffers(),
            SizedBox(height: getProportionateScreenHeight(10)),
            PopularProducts(),
            SizedBox(height: getProportionateScreenHeight(10)),
          ],
        ),
      ),
    );
  }
}
