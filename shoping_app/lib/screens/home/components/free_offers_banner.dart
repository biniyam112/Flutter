import 'package:flutter/material.dart';

import '../../../size_config.dart';

class FreeOffersBanner extends StatelessWidget {
  const FreeOffersBanner({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      // height: 92,
      margin: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(20),
        vertical: getProportionateScreenHeight(10),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(20),
        vertical: getProportionateScreenHeight(20),
      ),
      decoration: BoxDecoration(
        color: Color(0xFF4A3298),
        borderRadius: BorderRadius.circular(26),
      ),
      child: Text.rich(
        TextSpan(
          text: 'Special giveaways\n',
          style: TextStyle(color: Colors.white),
          children: [
            TextSpan(
              text: 'Get the 24hrs special free ofer',
              style: TextStyle(
                fontSize: 20,
                height: 1.6,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
