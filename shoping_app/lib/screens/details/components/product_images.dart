import 'package:flutter/material.dart';
import 'package:shoping_app/models/products.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class ProductImages extends StatefulWidget {
  const ProductImages({
    Key key,
    @required this.product,
  }) : super(key: key);

  final Product product;

  @override
  _ProductImagesState createState() => _ProductImagesState();
}

class _ProductImagesState extends State<ProductImages> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: getProportionateScreenWidth(220),
          child: AspectRatio(
            aspectRatio: 1,
            child: Image.asset(widget.product.images[selectedIndex]),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...List.generate(
              widget.product.images.length,
              (index) => buildSmallPreview(index),
            ),
          ],
        ),
      ],
    );
  }

  Widget buildSmallPreview(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Container(
        margin: EdgeInsets.only(right: getProportionateScreenWidth(16)),
        padding: EdgeInsets.all(getProportionateScreenWidth(8)),
        height: getProportionateScreenWidth(52),
        width: getProportionateScreenWidth(52),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: selectedIndex == index
                ? kPrimaryColor.withOpacity(.8)
                : Colors.transparent,
            width: 2,
          ),
        ),
        child: Image.asset(widget.product.images[index]),
      ),
    );
  }
}
