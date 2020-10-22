import 'package:flutter/material.dart';
import 'package:travelers_app/components/place_card.dart';
import 'package:travelers_app/constants.dart';
import 'package:travelers_app/models/TravelSpot.dart';
import 'package:travelers_app/size_config.dart';

class Body extends StatelessWidget {
  const Body({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionalScreenWidth(20)),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(bottom: 20, top: 20),
            child: Wrap(
              alignment: WrapAlignment.spaceAround,
              runSpacing: 20,
              children: [
                ...List.generate(
                  travelSpots.length,
                  (index) => PlaceCard(
                    isfullCard: true,
                    travelSpot: travelSpots[index],
                    onPress: () {},
                  ),
                ),
                Container(
                  height: getProportionalScreenHeight(350),
                  width: getProportionalScreenWidth(170),
                  decoration: BoxDecoration(
                    color: Color(0xFF6A6C93).withOpacity(.1),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      width: 2,
                      color: Color(0xFFEBE8F6),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: getProportionalScreenWidth(54),
                        width: getProportionalScreenWidth(54),
                        child: FlatButton(
                          padding: EdgeInsets.zero,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(60),
                          ),
                          color: kPrimaryColor,
                          onPressed: () {},
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                            size: getProportionalScreenWidth(36),
                          ),
                        ),
                      ),
                      VerticalSpacing(of: 10),
                      Text(
                        'Add new place',
                        style: TextStyle(
                          fontSize: getProportionalScreenWidth(14),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
