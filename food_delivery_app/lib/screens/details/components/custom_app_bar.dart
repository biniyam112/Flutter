import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          borderRadius: BorderRadius.circular(20),
          child: Container(
            height: 40,
            width: 40,
            child: Icon(
              Icons.arrow_back_ios,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(right: 10),
          child: InkWell(
            onTap: () {},
            borderRadius: BorderRadius.circular(30),
            child: Container(
              height: 50,
              width: 50,
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: SvgPicture.asset('assets/icons/menu.svg'),
            ),
          ),
        ),
      ],
    );
  }
}
