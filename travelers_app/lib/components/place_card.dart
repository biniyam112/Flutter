import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:travelers_app/models/TravelSpot.dart';

import '../constants.dart';
import '../size_config.dart';
import '../screens/home/components/travelers.dart';

class PlaceCard extends StatelessWidget {
  const PlaceCard({
    Key key,
    @required this.travelSpot,
    @required this.onPress,
    this.isfullCard = false,
  }) : super(key: key);

  final TravelSpot travelSpot;
  final bool isfullCard;
  final GestureTapCallback onPress;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: getProportionalScreenWidth(isfullCard ? 170 : 150),
      child: Column(
        children: [
          AspectRatio(
            aspectRatio: isfullCard ? 1.1 : 1.3,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                image: DecorationImage(
                  image: AssetImage(
                    travelSpot.image,
                  ),
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
                ),
              ),
            ),
          ),
          Container(
            width: getProportionalScreenWidth(isfullCard ? 170 : 150),
            padding: EdgeInsets.all(kDefaultPadding / 2),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  offset: Offset(2, 2),
                  color: Colors.black12,
                  blurRadius: 20,
                ),
              ],
            ),
            child: Column(
              children: [
                Text(
                  travelSpot.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: getProportionalScreenWidth(isfullCard ? 18 : 15),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                if (isfullCard)
                  Text(
                    travelSpot.date.day.toString(),
                    style: Theme.of(context).textTheme.headline4.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                if (isfullCard)
                  Text(
                    DateFormat.MMMM().format(travelSpot.date).toString() +
                        ' ' +
                        travelSpot.date.year.toString(),
                  ),
                VerticalSpacing(of: 10),
                Travelers(travelSpot: travelSpot),
                VerticalSpacing(of: 10),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
