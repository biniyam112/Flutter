import 'package:flutter/material.dart';

import '../../../constants.dart';

class ChapterCard extends StatelessWidget {
  const ChapterCard({
    Key key,
    @required this.chapterNumber,
    @required this.title,
    @required this.subtitle,
  }) : super(key: key);

  final int chapterNumber;
  final String title, subtitle;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(bottom: 24),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 30),
        width: size.width - 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(36),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 6),
              blurRadius: 14,
              color: Color(0xffd3d3d3),
            ),
          ],
        ),
        child: Row(
          children: [
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Chapter  ${chapterNumber.toString()} : $title',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: kBlackColor,
                    ),
                  ),
                  TextSpan(
                    text: '\n',
                  ),
                  TextSpan(
                    text: '$subtitle',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: kLightBlackColor,
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.arrow_forward_ios,
                size: 16,
              ),
            )
          ],
        ),
      ),
    );
  }
}
