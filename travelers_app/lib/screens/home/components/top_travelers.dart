import 'package:flutter/material.dart';
import 'package:travelers_app/components/section_title.dart';
import 'package:travelers_app/models/User.dart';

import '../../../constants.dart';
import '../../../size_config.dart';
import 'traveler_card.dart';

class TopTravelers extends StatelessWidget {
  const TopTravelers({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionTitle(
          titleText: 'Top Traveleres on Stark',
          onPress: () {},
        ),
        VerticalSpacing(of: 20),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ...List.generate(
                topTravelers.length,
                (index) {
                  return Padding(
                    padding: (index != topTravelers.length - 1)
                        ? EdgeInsets.only(left: kDefaultPadding)
                        : EdgeInsets.symmetric(horizontal: kDefaultPadding),
                    child: TravelerCard(
                      userName: topTravelers[index].name,
                      imagePath: topTravelers[index].image,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
