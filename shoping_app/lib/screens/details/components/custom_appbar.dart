import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shoping_app/components/rounded_icon_button.dart';

import '../../../size_config.dart';

class CustonAppBar extends PreferredSize {
  final BuildContext context;

  CustonAppBar({
    @required this.context,
    @required this.rating,
  });
  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);

  final double rating;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          width: double.infinity,
          color: Colors.transparent,
          height: getProportionateScreenHeight(200),
          child: Row(
            children: [
              RoundedIconButton(
                iconData: Icons.arrow_back_ios,
                onPress: () => Navigator.pop(context),
              ),
              Spacer(),
              Container(
                height: getProportionateScreenWidth(36),
                width: getProportionateScreenWidth(76),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      rating.toString(),
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SvgPicture.asset(
                      'assets/icons/Star Icon.svg',
                      height: getProportionateScreenHeight(16),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
