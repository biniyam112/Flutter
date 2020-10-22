import 'package:flutter/material.dart';
import 'package:shoping_app/models/products.dart';
import 'package:shoping_app/size_config.dart';

import 'product_color_select.dart';
import 'product_description.dart';
import 'product_images.dart';

class Body extends StatelessWidget {
  final Product product;
  const Body({
    Key key,
    @required this.product,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        width: double.infinity,
        height: SizeConfig.screenHeight,
        child: Column(
          children: [
            ProductImages(product: product),
            Expanded(
              child: TopRoundedContainer(
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ProductDescription(product: product),
                    SizedBox(height: 10),
                    ProductColorSelect(product: product),
                    SizedBox(
                      height: getProportionateScreenHeight(20),
                    ),
                    AddtoCartButton(
                      text: 'Add to cart',
                      onPress: () {},
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TopRoundedContainer extends StatelessWidget {
  const TopRoundedContainer({
    Key key,
    this.color,
    this.child,
  }) : super(key: key);

  final Color color;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: getProportionateScreenWidth(20)),
      padding: EdgeInsets.only(top: getProportionateScreenWidth(20)),
      width: double.infinity,
      height: 300,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: child,
    );
  }
}
