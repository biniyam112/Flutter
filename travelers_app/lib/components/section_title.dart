import 'package:flutter/material.dart';

import '../constants.dart';
import '../size_config.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    Key key,
    @required this.titleText,
    @required this.onPress,
  }) : super(key: key);

  final String titleText;
  final GestureTapCallback onPress;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            titleText,
            style: TextStyle(
              color: kTextColor,
              fontSize: getProportionalScreenWidth(20),
              fontWeight: FontWeight.bold,
            ),
          ),
          GestureDetector(
            onTap: onPress,
            child: Text(
              'See All',
              style: TextStyle(
                fontSize: getProportionalScreenWidth(16),
                color: Colors.black87,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
