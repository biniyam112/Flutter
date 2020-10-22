import 'package:flutter/material.dart';
import 'package:travelers_app/models/TravelSpot.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class Travelers extends StatelessWidget {
  const Travelers({
    Key key,
    @required this.travelSpot,
  }) : super(key: key);

  final TravelSpot travelSpot;

  @override
  Widget build(BuildContext context) {
    int totalUsers = 0;
    return SizedBox(
      height: getProportionalScreenHeight(30),
      child: Stack(
        children: [
          ...List.generate(
            travelSpot.users.length,
            (index) {
              totalUsers++;
              return Positioned(
                left: 22 * index.toDouble(),
                child: travelerFace(userIndex: index),
              );
            },
          ),
          Positioned(
            left: (totalUsers * 22).toDouble(),
            child: SizedBox(
              height: getProportionalScreenWidth(28),
              width: getProportionalScreenWidth(28),
              child: FlatButton(
                padding: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14)),
                color: kPrimaryColor,
                onPressed: () {},
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  ClipOval travelerFace({
    @required int userIndex,
  }) {
    return ClipOval(
      child: Image.asset(
        travelSpot.users[userIndex].image,
        height: getProportionalScreenWidth(28),
        width: getProportionalScreenWidth(28),
        fit: BoxFit.cover,
      ),
    );
  }
}
