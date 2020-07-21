import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:password_saver/models/accountModel.dart';
import 'package:password_saver/models/userModel.dart';
import 'package:password_saver/services/firestoreService.dart';
import 'package:provider/provider.dart';

Widget dropdownItem(Account account,BuildContext context) {
  final _user = Provider.of<User>(context);
  return
    DropdownButtonHideUnderline(
    child: DropdownButton(
      icon: Icon(
        Icons.filter_list,
        size: 24,
        color: Colors.white,
      ),
      items: <DropdownMenuItem>[
        DropdownMenuItem(
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              new Icon(
                FontAwesomeIcons.edit,
                color: Color(0xFF022d09),
                size: 18,
              ),
              new Text(
                  'edit',
                style: new TextStyle(
                  color: Color(0xFF022d09),
                ),
              ),
            ],
          ),
          value: 0,
        ),
        DropdownMenuItem(
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              new Icon(
                FontAwesomeIcons.dumpster,
                color: Color(0xFF022d09),
                size: 18,
              ),
              new Text(
                'delete',
                style: new TextStyle(
                  color: Color(0xFF022d09),
                ),
              ),
            ],
          ),
          value: 1,
          onTap: ()async{
            final _db = DatabaseHandler( uid: _user.userId);
            _db.deleteAccount(account);
            Navigator.pop(context);
          },
          
        ),
      ],
      onChanged: (value) {},
    ),
  );
}
