import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants.dart';

class CartItems extends StatelessWidget {
  const CartItems({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(60),
          child: Container(
            height: 70,
            width: 70,
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: kPrimaryColor.withOpacity(.3),
              shape: BoxShape.circle,
            ),
            child: Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: kPrimaryColor,
                shape: BoxShape.circle,
              ),
              child: SvgPicture.asset(
                'assets/icons/bag.svg',
                color: Colors.white,
              ),
            ),
          ),
        ),
        Positioned(
          top: 36,
          right: 0,
          child: Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: kPrimaryColor,
              ),
              shape: BoxShape.circle,
            ),
            child: Text(
              '3',
              style: TextStyle(
                color: kPrimaryColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
