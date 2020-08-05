import 'package:flutter/material.dart';
import 'package:green_footprint/constants.dart';
import 'package:green_footprint/screens/details/components/details_screen.dart';

class RecomendedPlants extends StatelessWidget {
  const RecomendedPlants({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <Widget>[
          PlantItemCard(
            imagePath: 'assets/images/image_3.png',
            title: 'pierce',
            country: 'ethiopia',
            price: 60,
            onpress: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return DetailsScreen();
                },
              ));
            },
          ),
          PlantItemCard(
            imagePath: 'assets/images/image_1.png',
            title: 'cactus',
            country: 'usa',
            price: 56,
            onpress: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return DetailsScreen();
                },
              ));
            },
          ),
          PlantItemCard(
            imagePath: 'assets/images/image_2.png',
            title: 'pierce',
            country: 'ethiopia',
            price: 60,
            onpress: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return DetailsScreen();
                },
              ));
            },
          ),
        ],
      ),
    );
  }
}

class PlantItemCard extends StatelessWidget {
  const PlantItemCard({
    Key key,
    this.imagePath,
    this.title,
    this.country,
    this.price,
    this.onpress,
  }) : super(key: key);
  final String imagePath, title, country;
  final int price;
  final Function onpress;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onpress,
      child: Container(
        width: size.width * 0.4,
        margin: EdgeInsets.only(
          left: kDefaultPadding,
          right: kDefaultPadding / 2,
          bottom: kDefaultPadding * 2.5,
          top: kDefaultPadding / 2,
        ),
        child: Column(
          children: <Widget>[
            Image.asset(imagePath),
            Container(
              padding: EdgeInsets.all(
                kDefaultPadding,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(16),
                ),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 20,
                    color: kPrimaryColor.withOpacity(0.123),
                    offset: Offset(0, 10),
                  ),
                ],
              ),
              child: Row(
                children: <Widget>[
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: '$title\n'.toUpperCase(),
                          style: Theme.of(context).textTheme.button,
                        ),
                        TextSpan(
                          text: '$country'.toUpperCase(),
                          style: TextStyle(
                            color: kPrimaryColor.withOpacity(0.5),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  Text(
                    '\$$price',
                    style: TextStyle(color: kPrimaryColor),
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
