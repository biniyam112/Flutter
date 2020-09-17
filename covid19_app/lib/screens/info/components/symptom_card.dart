import 'package:flutter/material.dart';

import '../../../constant.dart';
import '../../../size_configuration.dart';

class SymptomCard extends StatelessWidget {
  const SymptomCard({
    Key key,
    this.imagePath,
    this.symptomText,
  }) : super(key: key);
  final String imagePath, symptomText;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(
        getProportionateScreenWidth(10),
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 10),
            blurRadius: 20,
            color: kActiveShadowColor,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
            imagePath,
            height: getProportionateScreenHeight(90),
          ),
          Text(
            symptomText,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: getProportionateScreenWidth(14),
            ),
          )
        ],
      ),
    );
  }
}
