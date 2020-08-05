import 'package:flutter/material.dart';
import 'package:green_footprint/constants.dart';

class FeaturedPlants extends StatelessWidget {
  const FeaturedPlants({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <Widget>[
          FeaturePlantCard(
            imagePath: 'assets/images/bottom_img_1.png',
            onpress: () {},
          ),
          FeaturePlantCard(
            imagePath: 'assets/images/bottom_img_2.png',
            onpress: () {},
          ),
          FeaturePlantCard(
            imagePath: 'assets/images/bottom_img_1.png',
            onpress: () {},
          ),
        ],
      ),
    );
  }
}

class FeaturePlantCard extends StatelessWidget {
  const FeaturePlantCard({
    Key key,
    this.imagePath,
    this.onpress,
  }) : super(key: key);
  final String imagePath;
  final Function onpress;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onpress,
      child: Container(
        margin: EdgeInsets.only(
          left: kDefaultPadding,
          top: kDefaultPadding / 2,
          bottom: kDefaultPadding / 2,
        ),
        width: size.width * 0.8,
        height: 185,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(imagePath),
          ),
        ),
      ),
    );
  }
}
