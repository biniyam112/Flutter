import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants.dart';

class TextFieldItem extends StatelessWidget {
  const TextFieldItem({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity - 100,
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: kBorderColor),
      ),
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: TextField(
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 6),
            prefixIcon: SvgPicture.asset(
              'assets/icons/search.svg',
            ),
            hintText: 'Search',
            hintStyle: TextStyle(color: Colors.black),
            border: InputBorder.none,
            enabledBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
