import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class ProfileMenuItem extends StatelessWidget {
  const ProfileMenuItem({
    Key key,
    this.iconPath,
    this.title,
    this.onPress,
  }) : super(key: key);
  final String iconPath, title;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;

    return InkWell(
      onTap: () => onPress,
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: defaultSize,
          horizontal: defaultSize * 2,
        ),
        child: SafeArea(
          child: Row(
            children: [
              SvgPicture.asset(iconPath),
              SizedBox(width: defaultSize * 2),
              Text(
                title,
                style: TextStyle(
                  fontSize: defaultSize * 1.8,
                  color: kTextLigntColor,
                ),
              ),
              Spacer(),
              IconButton(
                onPressed: onPress,
                icon: Icon(
                  Icons.arrow_forward_ios,
                  size: defaultSize * 1.8,
                  color: kTextLigntColor,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
