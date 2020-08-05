import 'package:flutter/material.dart';
import 'package:green_footprint/constants.dart';
import 'package:green_footprint/screens/details/components/bottom_buttons.dart';
import 'package:green_footprint/screens/details/components/image_with_side_icons.dart';
import 'package:green_footprint/screens/details/components/title_with_price.dart';

class Body extends StatelessWidget {
  const Body({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: <Widget>[
            ImageWithSideIcons(),
            TitleWithPrice(title: 'Rosemary', country: 'Russia', price: 40),
            SizedBox(
              height: kDefaultPadding,
            ),
            BottomButtons(),
          ],
        ),
      ),
    );
  }
}
