import 'package:flutter/material.dart';
import 'package:shoping_app/components/product_card.dart';
import 'package:shoping_app/models/products.dart';

import '../../../size_config.dart';
import 'item_section_text.dart';

class PopularProducts extends StatelessWidget {
  const PopularProducts({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ItemSectionText(
          text: 'Popular products',
          press: () {},
        ),
        SizedBox(
          height: getProportionateScreenHeight(260),
          width: double.infinity,
          child: ListView.builder(
            itemCount: demoProducts.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: EdgeInsets.only(
                  left: getProportionateScreenWidth(16),
                  top: index.isEven ? getProportionateScreenHeight(20) : 0,
                ),
                child: ProductCard(product: demoProducts[index]),
              );
            },
          ),
        ),
      ],
    );
  }
}
