import 'package:flutter/material.dart';
import 'package:food_app_web/constants.dart';

class BodyContent extends StatelessWidget {
  const BodyContent({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.all(20),
      width: size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'burger'.toUpperCase(),
            style: Theme.of(context).textTheme.headline1.copyWith(
                  color: cTextColor,
                  fontWeight: FontWeight.bold,
                ),
          ),
          SizedBox(
            width: size.width * 0.3,
            child: Text(
              'A hamburger is a sandwich consisting of one or more cooked patties of ground meat.',
              overflow: TextOverflow.visible,
              style: TextStyle(
                color: cTextColor.withOpacity(0.44),
                fontSize: 22,
              ),
            ),
          ),
          FittedBox(
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              decoration: BoxDecoration(
                color: Color(0xFF372930),
                borderRadius: BorderRadius.all(
                  Radius.circular(36),
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.all(
                  Radius.circular(36),
                ),
                child: FlatButton(
                  padding: EdgeInsets.all(15),
                  onPressed: () {},
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        height: 38,
                        width: 38,
                        decoration: BoxDecoration(
                          color: cPrimaryColor,
                          shape: BoxShape.circle,
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xFF372930),
                          ),
                        ),
                      ),
                      SizedBox(width: 15),
                      Text(
                        'get started'.toUpperCase(),
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 15),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
