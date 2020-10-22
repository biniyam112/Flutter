import 'package:flutter/material.dart';

import '../../../size_config.dart';
import 'search_field.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          overflow: Overflow.visible,
          alignment: Alignment.center,
          children: [
            Image.asset(
              'assets/images/home_bg.png',
              height: getProportionalScreenHeight(314),
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: getProportionalScreenHeight(40)),
                Text(
                  'Travel with you!',
                  style: TextStyle(
                      fontSize: getProportionalScreenWidth(42),
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                      height: 1.5),
                ),
                Text(
                  'Travel Community Platform',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: getProportionalScreenWidth(-30),
              child: SearchField(),
            ),
          ],
        ),
        VerticalSpacing(),
      ],
    );
  }
}
