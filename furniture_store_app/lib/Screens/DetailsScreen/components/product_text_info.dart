import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:furniture_store_app/constants.dart';
import 'package:furniture_store_app/models/Product.dart';
import 'package:furniture_store_app/size_config.dart';

class ProductInfo extends StatelessWidget {
  const ProductInfo({
    Key key,
    @required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;
    TextStyle lightTextStyle = TextStyle(
      color: kTextColor.withOpacity(.6),
    );
    return Container(
      padding: EdgeInsets.all(defaultSize),
      height: defaultSize * 37.5,
      width: defaultSize *
          (SizeConfig.orientation == Orientation.landscape ? 35 : 15),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(product.category.toUpperCase(), style: lightTextStyle),
            SizedBox(height: defaultSize),
            Text(
              product.title,
              style: TextStyle(
                fontSize: defaultSize * 2.4,
                fontWeight: FontWeight.bold,
                height: 1.4,
                letterSpacing: -.8,
              ),
            ),
            SizedBox(height: defaultSize * 2),
            Text('Form', style: lightTextStyle),
            Text(
              '\$${product.price}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: defaultSize * 1.6,
                height: 1.6,
              ),
            ),
            SizedBox(height: defaultSize * 2),
            Text('Available colors', style: lightTextStyle),
            Row(
              children: [
                buildColorOption(color: Color(0xFF7BA275), isSelected: true),
                buildColorOption(color: Color(0xFFD7D7D7)),
                buildColorOption(color: Color(0xFF000000)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Container buildColorOption({Color color, bool isSelected = false}) {
    double defaultSize = SizeConfig.defaultSize;
    return Container(
      height: defaultSize * 2.4,
      width: defaultSize * 2.4,
      margin: EdgeInsets.only(top: defaultSize, right: defaultSize),
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: color,
      ),
      child: isSelected ? SvgPicture.asset('assets/icons/check.svg') : null,
    );
  }
}
