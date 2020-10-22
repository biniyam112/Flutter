import 'package:flutter/material.dart';
import 'package:travelers_app/components/section_title.dart';
import 'package:travelers_app/models/TravelSpot.dart';

import '../../../constants.dart';
import '../../../size_config.dart';
import '../../../components/place_card.dart';

class PopularPlaces extends StatelessWidget {
  const PopularPlaces({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SectionTitle(
          titleText: 'Right now at Spark',
          onPress: () {},
        ),
        VerticalSpacing(of: 20),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ...List.generate(
                travelSpots.length,
                (index) {
                  return Padding(
                    padding: (index != travelSpots.length - 1)
                        ? EdgeInsets.only(left: kDefaultPadding)
                        : EdgeInsets.symmetric(horizontal: kDefaultPadding),
                    child: PlaceCard(
                      travelSpot: travelSpots[index],
                      onPress: () {},
                    ),
                  );
                },
              ),
            ],
          ),
        )
      ],
    );
  }
}
