import 'package:flutter/material.dart';
import 'package:green_footprint/constants.dart';

class BottomButtons extends StatelessWidget {
  const BottomButtons({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(bottom: kDefaultPadding),
      child: Row(
        children: <Widget>[
          SizedBox(
            width: size.width / 2,
            height: 74,
            child: FlatButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                ),
              ),
              color: kPrimaryColor,
              onPressed: () {},
              child: Text(
                'Buy Now',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          SizedBox(
            width: size.width / 2,
            height: 74,
            child: FlatButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                ),
              ),
              child: Text(
                'Description',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
              color: Color(0xFF564397),
              onPressed: () {},
            ),
          ),
          SizedBox(height: kDefaultPadding * 2),
        ],
      ),
    );
  }
}
