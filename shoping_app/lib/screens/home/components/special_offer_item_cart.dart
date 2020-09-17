import 'package:flutter/material.dart';

import '../../../size_config.dart';

class SpecialOfferItemsCard extends StatelessWidget {
  const SpecialOfferItemsCard({
    Key key,
    @required this.category,
    @required this.imagePath,
    @required this.numOfItems,
    @required this.press,
  }) : super(key: key);
  final String category, imagePath;
  final int numOfItems;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        right: getProportionateScreenWidth(12),
      ),
      child: SizedBox(
        width: 242,
        height: 100,
        child: InkWell(
          onTap: press,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Stack(
              children: [
                Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xFF343434).withOpacity(.4),
                        Color(0xFF343434).withOpacity(.15)
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(16),
                    vertical: getProportionateScreenHeight(10),
                  ),
                  child: Text.rich(
                    TextSpan(
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                      ),
                      children: [
                        TextSpan(
                          text: '$category\n',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: getProportionateScreenWidth(18),
                          ),
                        ),
                        TextSpan(
                          text: '$numOfItems brands',
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
