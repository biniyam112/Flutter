import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:password_saver/models/accountModel.dart';
import 'package:password_saver/screens/accountDetailsPage/dropdownItem.dart';

class AccountDetails extends StatefulWidget {
  final Account account;
  AccountDetails({@required this.account});

  @override
  State<StatefulWidget> createState() {
    return _AccountDetails(account: account);
  }
}

class _AccountDetails extends State {
  Account account;
  _AccountDetails({@required this.account});

  @override
  Widget build(BuildContext context) {
    print('\n\n\n${account.password}\n\n\n');
    return Scaffold(
      body: new Container(
        height: MediaQuery.of(context).size.height,
        alignment: Alignment.bottomCenter,
        decoration: new BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color(0xFF3383CD),
                Color(0xFF11249F),
              ]),
        ),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            // the green container
            new Container(
              height: MediaQuery.of(context).size.height * (1 / 3),
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: new EdgeInsets.only(
                      top: 28,
                    ),
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        new Align(
                          alignment: Alignment.centerLeft,
                          child: new Padding(
                            padding: new EdgeInsets.only(
                              left: 20,
                            ),
                            child: new Theme(
                              data: Theme.of(context).copyWith(
                                canvasColor: Colors.white,
                              ),
                              child: IconButton(
                                onPressed: () => Navigator.pop(context),
                                icon: Icon(
                                  Icons.arrow_back_ios,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                        new Align(
                          alignment: Alignment.centerRight,
                          child: new Padding(
                            padding: new EdgeInsets.only(
                              right: 30,
                            ),
                            child: new Theme(
                              data: Theme.of(context).copyWith(
                                canvasColor: Colors.white,
                              ),
                              child: dropdownItem(account,context),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  new CircleAvatar(
                    backgroundColor: Colors.white,
                    maxRadius: MediaQuery.of(context).size.width / 8,
                    child: new Text(
                      account.accountName.substring(0, 1).toUpperCase() ?? '',
                      style: new TextStyle(
                          fontFamily: 'Nunito',
                          fontSize: 40,
                          color: Color(0xFF1E1D1E),
                          fontWeight: FontWeight.w900),
                    ),
                  ),
                ],
              ),
            ),
            // the white container
            new Container(
              height: MediaQuery.of(context).size.height * (2 / 3),
              alignment: Alignment.bottomCenter,
              decoration: new BoxDecoration(
                color: Color(0xFF1E1D1E),
                borderRadius: new BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
              ),
              child: new ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  List<String> titleList = [
                    'account name',
                    'email',
                    'password',
                    'last modified date',
                    'description'
                  ];
                  List<String> accountDetailsList = [
                    account.accountName,
                    account.email,
                    account.password,
                    account.modifiedDate,
                    account.accountDescription
                  ];
                  List<IconData> icons = [
                    FontAwesomeIcons.userCircle,
                    Icons.alternate_email,
                    Icons.verified_user,
                    Icons.date_range,
                    Icons.details,
                  ];
                  return accountFields(titleList[index],
                      accountDetailsList[index], icons[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget accountFields(String title, String value, IconData iconData) {
    return new Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        new Padding(
          padding: new EdgeInsets.symmetric(
            vertical: 12,
          ),
          child: new Container(
            width: MediaQuery.of(context).size.width - 40,
            decoration: new BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: ListTile(
              leading: Icon(
                iconData,
                size: 28,
                color: Color(0xFF009ACD),
              ),
              title: new Text(
                '$title',
                style: new TextStyle(
                  color: Colors.white,
                  fontFamily: 'Nunito',
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              subtitle: new Text(
                '$value',
                style: new TextStyle(
                  color: Colors.white,
                  fontFamily: 'Nunito',
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
