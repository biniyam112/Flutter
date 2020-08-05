import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:green_footprint/constants.dart';
import 'package:green_footprint/screens/details/components/icon_card.dart';

class ImageWithSideIcons extends StatelessWidget {
  const ImageWithSideIcons({
    Key key,
    this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(bottom: kDefaultPadding * 3),
      child: SizedBox(
        height: size.height * 0.8,
        child: Row(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: kDefaultPadding * 3),
                child: Column(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.topLeft,
                      child: IconButton(
                        padding: EdgeInsets.only(
                          right: kDefaultPadding,
                          left: kDefaultPadding,
                        ),
                        icon: SvgPicture.asset('assets/icons/back_arrow.svg'),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ),
                    Spacer(),
                    IconsCard(
                      iconPath: 'assets/icons/sun.svg',
                    ),
                    IconsCard(
                      iconPath: 'assets/icons/icon_2.svg',
                    ),
                    IconsCard(
                      iconPath: 'assets/icons/icon_3.svg',
                    ),
                    IconsCard(
                      iconPath: 'assets/icons/icon_4.svg',
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: size.height * 0.8,
              width: size.width * 0.75,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.horizontal(
                  left: Radius.circular(60),
                ),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 10,
                    color: kPrimaryColor.withOpacity(0.129),
                  ),
                ],
                image: DecorationImage(
                  fit: BoxFit.cover,
                  alignment: Alignment.centerLeft,
                  image: AssetImage('assets/images/img.png'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
