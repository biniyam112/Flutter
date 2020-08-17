import 'package:flutter/material.dart';
import 'package:furniture_store_app/constants.dart';
import 'package:furniture_store_app/models/Product.dart';
import 'package:furniture_store_app/size_config.dart';

class ProductDescriptionandButton extends StatelessWidget {
  const ProductDescriptionandButton({
    Key key,
    @required this.onPress,
    @required this.product,
  }) : super(key: key);

  final Function onPress;
  final Product product;

  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;
    return Container(
      padding: EdgeInsets.only(
        top: defaultSize * 9,
        right: defaultSize * 2,
        left: defaultSize * 2,
      ),
      constraints: BoxConstraints(minHeight: defaultSize * 44),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(defaultSize * 1.2),
          topRight: Radius.circular(defaultSize * 1.2),
        ),
      ),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              product.subTitle,
              style: TextStyle(
                fontSize: defaultSize * 1.8,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: defaultSize * 2),
            Text(
              product.description,
              style: TextStyle(
                height: 1.4,
                color: kTextColor.withOpacity(.7),
              ),
            ),
            SizedBox(height: defaultSize * 2),
            SizedBox(
              width: double.infinity,
              child: FlatButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4)),
                padding: EdgeInsets.all(defaultSize * 1.6),
                color: kPrimaryColor,
                child: Text(
                  'Add to cart',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: defaultSize * 1.6,
                  ),
                ),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
