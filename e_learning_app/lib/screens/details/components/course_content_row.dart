import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class CourseContentRow extends StatelessWidget {
  const CourseContentRow({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: getProportionateScreenHeight(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '01',
            style: kHeadingStyle.copyWith(
                fontSize: 28, color: kTextColor.withOpacity(.3)),
          ),
          SizedBox(height: getProportionateScreenHeight(20)),
          Padding(
            padding: EdgeInsets.only(
              left: getProportionateScreenWidth(20),
            ),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: '5.35 Hours\n',
                    style: TextStyle(
                      color: kTextColor.withOpacity(.6),
                      fontSize: 18,
                    ),
                  ),
                  TextSpan(
                    text: 'Welcome to the course!',
                    style: TextStyle(
                      color: kTextColor,
                      height: 1.5,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Spacer(),
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: kGreenColor,
            ),
            child: Icon(
              Icons.play_arrow,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
