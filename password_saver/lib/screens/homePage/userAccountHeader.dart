import 'dart:math';
import 'package:flutter/material.dart';
import 'package:password_saver/models/userModel.dart';

Widget userAccountHeader(
    {@required User user, @required BuildContext context}) {
  return
      // the background
      new Container(
    width: 300,
    decoration: BoxDecoration(
      color: Color(0xFF1E1D1E),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        // real deal : account info plus options
        UserAccountsDrawerHeader(
          decoration: BoxDecoration(
            color: Colors.transparent,
          ),
          currentAccountPicture: CircleAvatar(
            backgroundColor:
                Colors.primaries[Random().nextInt(Colors.primaries.length)],
            child: new Text(
              user.userName.substring(0, 1).toUpperCase(),
              style: new TextStyle(
                fontWeight: FontWeight.w900,
                fontFamily: 'HelveticaNeue',
                fontSize: 32,
                color: Color(0xFFe5f4fb),
              ),
            ),
          ),
          accountName: new Padding(
            padding: new EdgeInsets.only(
              left: 4,
            ),
            child: new Text(
              user.userName,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: new TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontFamily: 'Nunito',
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          accountEmail: new Padding(
            padding: new EdgeInsets.only(
              left: 4,
            ),
            child: new Text(
              user.email,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: new TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontFamily: 'Nunito',
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        Divider(
          height: 1,
          indent: 16,
          endIndent: 16,
          thickness: 1,
          color: Color(0xFFDADADA),
        ),
      ],
    ),
  );
}
