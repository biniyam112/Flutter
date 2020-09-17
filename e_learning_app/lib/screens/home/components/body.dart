import 'package:e_learning_app/constants.dart';
import 'package:e_learning_app/size_config.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'course_search.dart';
import 'course_tiles.dart';

class Body extends StatelessWidget {
  const Body({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(
          left: 20,
          top: 20,
          right: 20,
        ),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset('assets/icons/menu.svg'),
                  Image.asset('assets/images/user.png'),
                ],
              ),
              SizedBox(height: SizeConfig.defaultSize * 3),
              Text(
                'Hi Benjamin',
                style: kHeadingStyle,
              ),
              SizedBox(height: getProportionateScreenHeight(20)),
              Text(
                'find out a course you want to learn',
                style: kSubheadingTextStyle,
              ),
              SearchCourse(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Categories',
                    style: kTitleTextStyle,
                  ),
                  Text(
                    'title',
                    style: kSubtitleTextStyle.copyWith(
                      color: kBlueColor,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: getProportionateScreenHeight(30),
              ),
              CourseTiles(),
            ],
          ),
        ),
      ),
    );
  }
}
