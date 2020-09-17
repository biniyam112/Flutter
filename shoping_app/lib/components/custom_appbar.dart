import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

PreferredSizeWidget customAppBar({
  BuildContext context,
  String title,
}) {
  return PreferredSize(
    preferredSize: Size(double.infinity, kToolbarHeight * 2),
    child: SafeArea(
      minimum: EdgeInsets.only(top: 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(left: 10),
            height: 22,
            width: 22,
            child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: SvgPicture.asset('assets/icons/Back Icon.svg')),
          ),
          Spacer(),
          Text(
            title,
            style: TextStyle(
              color: Color(0xFF6B6B6B),
              fontSize: 22,
            ),
          ),
          Spacer(),
          SizedBox(width: 22),
        ],
      ),
    ),
  );
}
