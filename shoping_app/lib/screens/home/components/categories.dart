import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../size_config.dart';

class Categories extends StatelessWidget {
  const Categories({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> _categories = [
      {'icon': 'assets/icons/Flash Icon.svg', 'text': 'Flash dell'},
      {'icon': 'assets/icons/Game Icon.svg', 'text': 'Game'},
      {'icon': 'assets/icons/Gift Icon.svg', 'text': 'Daily gift'},
      {'icon': 'assets/icons/Game Icon.svg', 'text': 'Game'},
      {'icon': 'assets/icons/Gift Icon.svg', 'text': 'Daily gift'},
      {'icon': 'assets/icons/Bill Icon.svg', 'text': 'Bill'},
      {'icon': 'assets/icons/Discover.svg', 'text': 'more'},
    ];
    return SizedBox(
      width: double.infinity,
      height: 120,
      child: ListView.builder(
        itemCount: _categories.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(
              left: 12,
              top: 10,
            ),
            child: CategoryCard(
              icon: _categories[index]['icon'],
              text: _categories[index]['text'],
              callback: () {},
            ),
          );
        },
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key key,
    @required this.icon,
    @required this.text,
    this.callback,
  }) : super(key: key);

  final String icon, text;
  final GestureTapCallback callback;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: getProportionateScreenWidth(55),
      child: Column(
        children: [
          AspectRatio(
            aspectRatio: 1,
            child: InkWell(
              borderRadius: BorderRadius.circular(10),
              onTap: callback,
              child: Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Color(0xFFFFECDF),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: SvgPicture.asset(icon),
              ),
            ),
          ),
          SizedBox(height: 5),
          Text(
            text,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
