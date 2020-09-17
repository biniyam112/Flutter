import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constant.dart';
import '../../../size_configuration.dart';

class PreventCart extends StatelessWidget {
  const PreventCart({
    Key key,
    this.messageTitle,
    this.detailedMessage,
    this.imagePath,
  }) : super(key: key);
  final String messageTitle, detailedMessage, imagePath;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getProportionateScreenHeight(180),
      child: Padding(
        padding: EdgeInsets.only(bottom: 20),
        child: Container(
          height: getProportionateScreenHeight(180),
          width: SizeConfig.screenWidth,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 8),
                blurRadius: 24,
                color: kShadowColor,
              ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: getProportionateScreenHeight(10),
            ),
            child: Stack(
              children: [
                Image.asset(
                  imagePath,
                  height: getProportionateScreenHeight(120),
                  alignment: Alignment.center,
                ),
                Positioned(
                  top: getProportionateScreenHeight(20),
                  left: getProportionateScreenWidth(130),
                  child: Container(
                    height: getProportionateScreenHeight(120),
                    width: SizeConfig.screenWidth -
                        getProportionateScreenWidth(180),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          messageTitle,
                          style: kTitleTextstyle.copyWith(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          height: getProportionateScreenHeight(10),
                        ),
                        Text(
                          detailedMessage,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(
                          height: getProportionateScreenHeight(10),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: SvgPicture.asset(
                              'assets/icons/forward.svg',
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
