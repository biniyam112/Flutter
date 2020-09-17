import 'package:e_learning_app/constants.dart';
import 'package:e_learning_app/models/category.dart';
import 'package:e_learning_app/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'course_content_row.dart';

class Body extends StatelessWidget {
  const Body({Key key, this.category}) : super(key: key);
  final Category category;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Color(0xFFF5F4E5),
        child: Column(
          children: [
            Container(
              height: SizeConfig.screenHieght / 2.7,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    category.imagePath,
                  ),
                  fit: BoxFit.contain,
                  alignment: Alignment.centerRight,
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                    vertical: getProportionateScreenHeight(16),
                    horizontal: getProportionateScreenWidth(20)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: Container(
                            margin: EdgeInsets.symmetric(vertical: 12),
                            child: SvgPicture.asset(
                              'assets/icons/arrow-left.svg',
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 12),
                          child: SvgPicture.asset(
                            'assets/icons/more-vertical.svg',
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(10),
                    ),
                    ClipPath(
                      clipper: BestSellerClipper(),
                      child: Container(
                        width: getProportionateScreenWidth(146),
                        decoration: BoxDecoration(
                          color: kBestSellerClor,
                        ),
                        padding:
                            EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                        child: Text(
                          'Best seller'.toUpperCase(),
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: getProportionateScreenHeight(16)),
                    Text(
                      ' study ${category.name}!'.toUpperCase(),
                      style: kTitleTextStyle.copyWith(
                        fontSize: 22,
                      ),
                    ),
                    SizedBox(height: getProportionateScreenHeight(16)),
                    Row(
                      children: [
                        SvgPicture.asset('assets/icons/person.svg'),
                        Text(
                          '14.6k',
                        ),
                        SizedBox(width: getProportionateScreenWidth(20)),
                        SvgPicture.asset('assets/icons/star.svg'),
                        Text(
                          '4.6',
                        ),
                      ],
                    ),
                    SizedBox(height: getProportionateScreenHeight(20)),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: '\$50 ',
                            style: kHeadingStyle.copyWith(fontSize: 32),
                          ),
                          TextSpan(
                            text: '\$70',
                            style: TextStyle(
                              color: kTextColor.withOpacity(.8),
                              decoration: TextDecoration.lineThrough,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(getProportionateScreenWidth(30)),
                decoration: BoxDecoration(
                  color: Color(0xFFEEEEEE),
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(40),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Course Content',
                      style: kTitleTextStyle,
                    ),
                    SizedBox(height: getProportionateScreenHeight(20)),
                    CourseContentRow(),
                    CourseContentRow(),
                    CourseContentRow(),
                    CourseContentRow(),
                  ],
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: getProportionateScreenHeight(100),
              decoration: BoxDecoration(
                color: Color(0xFFFFEdEE),
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(40),
                ),
              ),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 16),
                    child: Container(
                      padding: EdgeInsets.all(14),
                      height: getProportionateScreenWidth(60),
                      width: getProportionateScreenWidth(80),
                      decoration: BoxDecoration(
                        color: Color(0xFFAD2342).withOpacity(.1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: SvgPicture.asset(
                        'assets/icons/shopping-bag.svg',
                        height: 30,
                        width: 30,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: getProportionateScreenWidth(16),
                      ),
                      child: FlatButton(
                        padding: EdgeInsets.symmetric(
                          horizontal: getProportionateScreenWidth(40),
                          vertical: getProportionateScreenHeight(20),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40),
                        ),
                        color: Color(0xFF6668FF),
                        onPressed: () {},
                        child: Text(
                          'Buy Course',
                          style: kSubtitleTextStyle.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BestSellerClipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    Path path = Path();
    var height = size.height;
    var width = size.width;
    path.lineTo(width - 20, 0);
    path.lineTo(width, height / 2);
    path.lineTo(width - 20, height);
    path.lineTo(0, height);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return true;
  }
}
