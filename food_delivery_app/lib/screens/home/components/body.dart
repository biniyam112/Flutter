import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'catrgory_title.dart';
import 'food_card.dart';
import 'text_field_item.dart';

class Body extends StatefulWidget {
  Body({Key key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    List<String> categoryTitles = [
      'all',
      'pizza',
      'burger',
      'desert',
      'drinks',
      'specials',
    ];
    int activeCategoty = 0;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            right: 20,
            top: 40,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Text(
                  'All of your favorite foods \nare tap away',
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: InkWell(
                  borderRadius: BorderRadius.circular(30),
                  onTap: () {},
                  child: Container(
                    height: 40,
                    width: 40,
                    padding: EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: SvgPicture.asset(
                      'assets/icons/menu.svg',
                      color: Colors.black,
                      height: 10,
                      width: 10,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 70,
          width: double.infinity,
          child: ListView.builder(
            itemCount: categoryTitles.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return CategoryTitle(
                title: categoryTitles[index],
                isActive: index == activeCategoty ? true : false,
              );
            },
          ),
        ),
        TextFieldItem(),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SizedBox(width: 10),
              FoodCard(),
              FoodCard(),
              FoodCard(),
            ],
          ),
        ),
      ],
    );
  }
}
