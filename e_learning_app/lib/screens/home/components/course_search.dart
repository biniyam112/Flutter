import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../size_config.dart';

class SearchCourse extends StatelessWidget {
  const SearchCourse({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: getProportionateScreenHeight(30),
      ),
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      height: getProportionateScreenHeight(60),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xFFf5f5f7),
        borderRadius: BorderRadius.circular(40),
      ),
      child: Row(
        children: [
          SvgPicture.asset('assets/icons/search.svg'),
          SizedBox(
            width: getProportionateScreenWidth(20),
          ),
          Text(
            'Search any course',
            style: TextStyle(
              fontSize: 18,
              color: Color(0xFFa0a5bd),
            ),
          ),
        ],
      ),
    );
  }
}
