import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    Key key,
    @required this.hintText,
  }) : super(key: key);
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.screenWidth * .6,
      // height: 50,
      decoration: BoxDecoration(
        color: kSecondaryColor.withOpacity(.1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: TextField(
        onChanged: (value) {
          // do the search
        },
        decoration: InputDecoration(
          enabledBorder: InputBorder.none,
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          hintText: hintText,
          prefixIcon: Icon(Icons.search),
          contentPadding: EdgeInsets.symmetric(
            vertical: getProportionateScreenHeight(10),
            horizontal: getProportionateScreenWidth(20),
          ),
        ),
      ),
    );
  }
}
