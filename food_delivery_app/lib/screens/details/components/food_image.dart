import 'package:flutter/material.dart';

import '../../../constants.dart';

class FoodImage extends StatelessWidget {
  const FoodImage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: 300,
      decoration: BoxDecoration(
        color: kSecondaryColor,
        shape: BoxShape.circle,
      ),
      child: Padding(
        padding: EdgeInsets.all(6),
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'assets/images/image_1_big.png',
              ),
              fit: BoxFit.fitHeight,
            ),
          ),
        ),
      ),
    );
  }
}
