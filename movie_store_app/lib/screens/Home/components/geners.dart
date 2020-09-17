import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class GenerCard extends StatefulWidget {
  GenerCard({Key key, this.geners}) : super(key: key);
  final List<String> geners;

  @override
  _GenersState createState() => _GenersState(geners: geners);
}

class _GenersState extends State<GenerCard> {
  int selectedIndex = 0;
  final List<String> geners;

  _GenersState({this.geners});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: getProportionateScreenHeight(50),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: geners.length,
        itemBuilder: (context, index) {
          return buildGenerText(index, context);
        },
      ),
    );
  }

  Widget buildGenerText(int index, BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: kDefaultPadding / 2),
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedIndex = index;
          });
        },
        child: Container(
          decoration: BoxDecoration(
            color:
                selectedIndex == index ? kSecondaryColor : Colors.transparent,
            border: Border.all(
              color: selectedIndex == index ? Colors.transparent : Colors.black,
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: EdgeInsets.all(kDefaultPadding / 2),
            child: Text(
              geners[index],
              style: Theme.of(context).textTheme.subtitle1.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: selectedIndex == index ? Colors.white : Colors.black,
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
