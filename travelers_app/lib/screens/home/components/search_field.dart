import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getProportionalScreenHeight(60),
      width: SizeConfig.screenWidth - getProportionalScreenWidth(60),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(
          color: Color(0xFF3E4067),
        ),
        boxShadow: [
          BoxShadow(
            offset: Offset(3, 3),
            blurRadius: 10,
            color: Colors.black.withOpacity(.16),
            spreadRadius: -2,
          ),
        ],
      ),
      child: TextField(
        onChanged: (value) {},
        decoration: InputDecoration(
          hintText: 'Search destination',
          hintStyle: TextStyle(
            fontSize: getProportionalScreenWidth(16),
            color: Color(0xFF464A7E),
          ),
          suffixIcon: Icon(
            Icons.search,
            color: Color(0xFF262A5E),
          ),
          contentPadding: EdgeInsets.symmetric(
            vertical: getProportionalScreenHeight(18),
            horizontal: kDefaultPadding,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
