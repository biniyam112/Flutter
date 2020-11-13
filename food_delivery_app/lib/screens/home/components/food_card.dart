import 'package:flutter/material.dart';
import 'package:food_delivery_app/screens/details/details_screen.dart';

import '../../../constants.dart';

class FoodCard extends StatelessWidget {
  const FoodCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return DetailsScreen();
          }),
        );
      },
      child: Container(
        height: 400,
        width: 270,
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              left: 0,
              // big background color
              child: Container(
                height: 380,
                width: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32),
                  color: kPrimaryColor.withOpacity(.06),
                ),
              ),
            ),
            // circular background color
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Container(
                height: 180,
                width: 180,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: kPrimaryColor.withOpacity(.16),
                ),
              ),
            ),
            // image container
            Positioned(
              top: 0,
              left: -50,
              child: Container(
                height: 180,
                width: 276,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/image_1_big.png'),
                  ),
                ),
              ),
            ),
            // item price
            Positioned(
              top: 80,
              right: 40,
              child: Text(
                '\$20',
                style: Theme.of(context).textTheme.headline6.copyWith(
                      color: kPrimaryColor.withOpacity(.9),
                    ),
              ),
            ),
            Positioned(
              top: 200,
              left: 20,
              child: Text(
                'Vegiterian table',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            Positioned(
              top: 236,
              left: 20,
              child: Container(
                width: 200,
                height: 200,
                child: Text(
                  'the vegitarian menu is filled with vegitables plus there are also some meat with in but ostly vegirable . so any vegitarian would love it.',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 5,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 15,
                    color: kTextColor,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 366,
              left: 20,
              child: Container(
                width: 200,
                height: 20,
                child: Text(
                  '450 Kcal',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 4,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
