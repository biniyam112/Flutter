import 'package:covid19_app/constant.dart';
import 'package:covid19_app/screens/home/components/app_header.dart';
import 'package:covid19_app/size_configuration.dart';
import 'package:flutter/material.dart';

import 'prevent_cart.dart';
import 'symptom_card.dart';

class Body extends StatelessWidget {
  Body({Key key}) : super(key: key);

  final List imagePaths = [
    'assets/images/caugh.png',
    'assets/images/fever.png',
    'assets/images/headache.png',
  ];
  final List symptomTypes = ['Caugh', 'Fever', 'Headache'];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              AppHeader(
                picpath: 'assets/icons/coronadr.svg',
                text: 'Get more info \n about Covid-19',
              ),
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        height: 30,
                        width: 30,
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Symptoms',
                  style: kTitleTextstyle,
                ),
                SizedBox(
                  height: getProportionateScreenHeight(20),
                ),
                SizedBox(
                  height: 150,
                  width: SizeConfig.screenWidth,
                  child: GridView.builder(
                    itemBuilder: (context, index) {
                      return gridViewItems(index);
                    },
                    itemCount: imagePaths.length,
                    scrollDirection: Axis.horizontal,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        crossAxisSpacing: getProportionateScreenWidth(30),
                        mainAxisSpacing: getProportionateScreenWidth(20)),
                  ),
                ),
                SizedBox(
                  height: getProportionateScreenHeight(20),
                ),
                Text(
                  'Prevention',
                  style: kTitleTextstyle,
                ),
                SizedBox(
                  height: getProportionateScreenHeight(20),
                ),
                PreventCart(
                  messageTitle: 'Wash hands regularly',
                  detailedMessage:
                      'Since the start of the outbreak one of the few protections we got is washing hands frequently',
                  imagePath: 'assets/images/wash_hands.png',
                ),
                PreventCart(
                  messageTitle: 'Wear mask',
                  detailedMessage:
                      'Wearing mask is by far the most efffective way of preventing the spread.',
                  imagePath: 'assets/images/wear_mask.png',
                ),
                SizedBox(
                  height: getProportionateScreenHeight(20),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  SymptomCard gridViewItems(int index) {
    return SymptomCard(
      imagePath: imagePaths[index],
      symptomText: symptomTypes[index],
    );
  }
}
