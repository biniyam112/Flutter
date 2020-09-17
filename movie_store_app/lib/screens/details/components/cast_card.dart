import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class CastCard extends StatelessWidget {
  const CastCard({
    Key key,
    this.cast,
  }) : super(key: key);
  final Map<String, String> cast;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: kDefaultPadding),
      width: getProportionateScreenWidth(100),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: Image.asset(
              cast['image'],
              height: 80,
            ),
          ),
          SizedBox(height: kDefaultPadding / 2),
          Text(
            cast['orginalName'],
            style: Theme.of(context).textTheme.bodyText2,
            textAlign: TextAlign.center,
            maxLines: 2,
          ),
          SizedBox(height: kDefaultPadding / 4),
          Text(
            cast['movieName'],
            style: TextStyle(color: kTextLightColor),
            textAlign: TextAlign.center,
            maxLines: 1,
          )
        ],
      ),
    );
  }
}
