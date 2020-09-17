import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class TopProfileStack extends StatelessWidget {
  const TopProfileStack({
    Key key,
    this.name,
    this.email,
    this.imagePath,
  }) : super(key: key);
  final String name, email, imagePath;

  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;

    return SizedBox(
      height: defaultSize * 24,
      child: Stack(
        children: [
          ClipPath(
            clipper: CustomShape(),
            child: Container(
              color: kPrimaryColor,
              height: defaultSize * 15,
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: defaultSize),
                  height: defaultSize * 14,
                  width: defaultSize * 14,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.white,
                      width: defaultSize * .8,
                    ),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(imagePath),
                    ),
                  ),
                ),
                Text(
                  name,
                  style: TextStyle(
                    color: kTextColor,
                    fontSize: defaultSize * 2.2,
                  ),
                ),
                SizedBox(height: defaultSize / 2),
                Text(
                  email,
                  style: TextStyle(
                    color: Color(0xFF8492A2),
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CustomShape extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    double height = size.height;
    double width = size.width;
    path.lineTo(0, height - 100);
    path.quadraticBezierTo(width / 2, height, width, height - 100);
    path.lineTo(width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
