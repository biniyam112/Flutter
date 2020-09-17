import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shoping_app/models/products.dart';

import '../constants.dart';
import '../size_config.dart';

class ProductCard extends StatefulWidget {
  ProductCard({
    Key key,
    @required this.product,
    this.width = 140,
    this.aspectRatio = 1.01,
  }) : super(key: key);
  final Product product;
  final double width, aspectRatio;

  @override
  _ProductCardState createState() => _ProductCardState(
        product: product,
        aspectRatio: aspectRatio,
        width: width,
      );
}

class _ProductCardState extends State<ProductCard> {
  _ProductCardState({
    this.width = 140,
    this.aspectRatio = 1.01,
    this.product,
  });
  final Product product;
  final double width, aspectRatio;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: getProportionateScreenWidth(width ?? 140),
      child: Column(
        children: [
          AspectRatio(
            aspectRatio: aspectRatio ?? 1.01,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: kSecondaryColor.withOpacity(.1),
              ),
              child: Image.asset(product.images[0]),
            ),
          ),
          const SizedBox(height: 5),
          Text(
            demoProducts[0].description,
            style: TextStyle(color: Colors.black),
            maxLines: 2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '\$ ${product.price}',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: getProportionateScreenWidth(18),
                  color: kPrimaryColor,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: getProportionateScreenWidth(8)),
                child: InkWell(
                  borderRadius: BorderRadius.circular(14),
                  onTap: () {
                    setState(() {
                      productisFavrote(product);
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.all(7),
                    height: getProportionateScreenWidth(28),
                    width: getProportionateScreenWidth(28),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: product.isFavourite
                            ? Color(0xFFFE5353).withOpacity(.1)
                            : kSecondaryColor.withOpacity(.4),
                        width: 1,
                      ),
                      color: product.isFavourite
                          ? Color(0xFFFE5353).withOpacity(.2)
                          : kSecondaryColor.withOpacity(.4),
                      shape: BoxShape.circle,
                    ),
                    child: SvgPicture.asset(
                      'assets/icons/Heart Icon_2.svg',
                      color:
                          product.isFavourite ? Colors.red : Color(0x33121212),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
