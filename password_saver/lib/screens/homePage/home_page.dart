import 'dart:math';
import 'package:flutter/material.dart';
import 'package:password_saver/models/accountModel.dart';
import 'package:password_saver/models/userModel.dart';
import 'package:password_saver/screens/PrivacyDetailsPage/privacy_details_page.dart';
import 'package:password_saver/screens/addAccountPage/addAccount.dart';
import 'package:password_saver/screens/homePage/accountWidgetList.dart';
import 'package:password_saver/screens/homePage/accountWidgetTile.dart';
import 'package:password_saver/screens/loginPage/loginPage.dart';
import 'package:password_saver/services/auth.dart';
import 'package:password_saver/services/firestoreService.dart';
import 'package:password_saver/widgets/loadingSpinner.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'userAccountHeader.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  final User user;
  HomePage({Key key, @required this.user}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState(this.user);
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    restoreViewState();
  }

  void saveViewState(bool isListView) async {
    SharedPreferences _sharedPref = await SharedPreferences.getInstance();
    _sharedPref.setBool('listView', isListView);
  }

  void restoreViewState() async {
    SharedPreferences _sharedPref = await SharedPreferences.getInstance();
    _listView = _sharedPref.getBool('listView') ?? true;
  }

  final User _user;
  _HomePageState(this._user);
  final _scaffoldkey = GlobalKey<ScaffoldState>();
  final _searchController = TextEditingController();
  String _searchText;
  bool _listView = true;
  AuthService _authService = AuthService();
  Random random = new Random();

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Account>>.value(
      value: DatabaseHandler(uid: _user.userId).accounts,
      child: Scaffold(
        key: _scaffoldkey,
        drawer: drawer(_user),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Colors.white,
          // color: Color(0xFF1E1D1E),
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Stack(
                children: <Widget>[
                  new Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 4,
                    decoration: new BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [
                            Color(0xFF3383CD),
                            Color(0xFF11249F),
                          ]),
                    ),
                  ),
                  // the real deal : items in the in front
                  new Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 4,
                    child: new Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: new EdgeInsets.only(top: 40),
                          child: new Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Padding(
                                padding:
                                    new EdgeInsets.symmetric(horizontal: 10),
                                child: new IconButton(
                                  icon: Icon(
                                    Icons.menu,
                                    size: 30,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {
                                    _scaffoldkey.currentState.openDrawer();
                                  },
                                ),
                              ),
                              new Card(
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ),
                                child: new Container(
                                  height: 46,
                                  width:
                                      MediaQuery.of(context).size.width - 100,
                                  child: new DecoratedBox(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Color(0xFFFFFFFF),
                                    ),
                                    child: Center(
                                      child: new Padding(
                                        padding: new EdgeInsets.symmetric(
                                          horizontal: 8,
                                        ),
                                        child: new TextFormField(
                                          autofocus: false,
                                          controller: _searchController,
                                          validator: (String inputUsername) {
                                            setState(() {});
                                            return null;
                                          },
                                          onChanged: (inputValue) {
                                            setState(() {
                                              _searchText = inputValue;
                                            });
                                          },
                                          cursorColor: Colors.black26,
                                          style: new TextStyle(
                                              color: Color(0xBB000000),
                                              fontFamily: 'PopinsR',
                                              fontWeight: FontWeight.w600),
                                          cursorWidth: 1.3,
                                          decoration: InputDecoration(
                                              enabled: false,
                                              icon: new Icon(
                                                FontAwesomeIcons.search,
                                                color: Colors.black54,
                                                size: 16,
                                              ),
                                              border: InputBorder.none,
                                              hintText: 'Search',
                                              hintStyle: new TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.black54,
                                                fontFamily: 'PopinsR',
                                              ),
                                              suffix: new GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    _searchController.text = '';
                                                  });
                                                },
                                                child: new Padding(
                                                  padding:
                                                      new EdgeInsets.all(6),
                                                  child: new Icon(
                                                    (_searchController.text ==
                                                                null ||
                                                            _searchController
                                                                    .text ==
                                                                ' ' ||
                                                            _searchController
                                                                    .text ==
                                                                '')
                                                        ? null
                                                        : FontAwesomeIcons
                                                            .times,
                                                    color: Colors.black54,
                                                    size: 18,
                                                  ),
                                                ),
                                              )),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                color: Color(0xFF1E1D1E),
                height: MediaQuery.of(context).size.height * (3 / 4),
                width: MediaQuery.of(context).size.width,
                child: _listView
                    ? AccountItemsList()
                    : AccountItemsTile() ?? fadingcircle(),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return AddAccount(user: _user);
              }),
            );
          },
          tooltip: 'add account',
          backgroundColor: Colors.white,
          child: Icon(
            Icons.add,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  Widget drawer(User user) {
    return new Container(
      width: 300,
      color: Color(0xFF1E1D1E),
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          userAccountHeader(user: user, context: context),
          new FlatButton(
            highlightColor: Color(0xFF222222),
            splashColor: Color(0xFF444444),
            onPressed: () {},
            child: new ListTile(
              leading: Icon(
                FontAwesomeIcons.userAstronaut,
                color: Color(0xFFDADADA),
              ),
              title: new Text(
                'User info',
                style: new TextStyle(
                  color: Color(0xFFDADADA),
                  fontFamily: 'PopinsR',
                  fontWeight: FontWeight.w600,
                  fontSize: 17,
                ),
              ),
            ),
          ),
          new FlatButton(
            highlightColor: Color(0xFF222222),
            splashColor: Color(0xFF444444),
            onPressed: () {},
            child: new ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return AddAccount(
                      user: _user,
                    );
                  }),
                );
              },
              leading: Icon(
                FontAwesomeIcons.accusoft,
                color: Color(0xFFDADADA),
              ),
              title: new Text(
                'Add account',
                style: new TextStyle(
                  color: Color(0xFFDADADA),
                  fontFamily: 'PopinsR',
                  fontWeight: FontWeight.w600,
                  fontSize: 17,
                ),
              ),
            ),
          ),
          new FlatButton(
            highlightColor: Color(0xFF222222),
            splashColor: Color(0xFF444444),
            onPressed: () {},
            child: new ListTile(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) {
                    return PrivacyDetails();
                  }),
                );
              },
              leading: Icon(
                FontAwesomeIcons.mailBulk,
                color: Color(0xFFDADADA),
              ),
              title: new Text(
                'Privacy',
                style: new TextStyle(
                  color: Color(0xFFDADADA),
                  fontFamily: 'PopinsR',
                  fontWeight: FontWeight.w600,
                  fontSize: 17,
                ),
              ),
            ),
          ),
          new FlatButton(
            highlightColor: Color(0xFF222222),
            splashColor: Color(0xFF444444),
            onPressed: () {},
            child: new ListTile(
              leading: Icon(
                Icons.settings,
                color: Color(0xFFDADADA),
              ),
              title: new Text(
                'Settings',
                style: new TextStyle(
                  color: Color(0xFFDADADA),
                  fontFamily: 'PopinsR',
                  fontWeight: FontWeight.w600,
                  fontSize: 17,
                ),
              ),
            ),
          ),
          new FlatButton(
            highlightColor: Color(0xFF222222),
            splashColor: Color(0xFF444444),
            onPressed: () {},
            child: new ListTile(
              onTap: () async {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return LoginPage();
                  }),
                );
                await _authService.signOut();
              },
              leading: Icon(
                FontAwesomeIcons.signOutAlt,
                color: Color(0xFFDADADA),
              ),
              title: new Text(
                'Sign out',
                style: new TextStyle(
                  color: Color(0xFFDADADA),
                  fontFamily: 'PopinsR',
                  fontWeight: FontWeight.w600,
                  fontSize: 17,
                ),
              ),
            ),
          ),
          new FlatButton(
            highlightColor: Color(0xFF222222),
            // splashColor: Color(0xFF444444),
            onPressed: () {
              setState(() {
                _listView = !_listView;
                saveViewState(_listView);
              });
            },
            child: new ListTile(
              leading: Icon(
                _listView ? Icons.dashboard : FontAwesomeIcons.listUl,
                color: Color(0xFFDADADA),
              ),
              title: new Text(
                'Change view',
                style: new TextStyle(
                  color: Color(0xFFDADADA),
                  fontFamily: 'PopinsR',
                  fontWeight: FontWeight.w600,
                  fontSize: 17,
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
          new FlatButton(
            highlightColor: Color(0xFF222222),
            splashColor: Color(0xFF333333),
            onPressed: () {},
            child: new ListTile(
              leading: new Text(
                'Help & feedback',
                style: new TextStyle(
                  color: Color(0xFFDADADA),
                  fontFamily: 'PopinsR',
                  fontWeight: FontWeight.w600,
                  fontSize: 17,
                ),
              ),
            ),
          ),
          new FlatButton(
            highlightColor: Color(0xFF222222),
            splashColor: Color(0xFF444444),
            onPressed: () {},
            child: new ListTile(
              leading: new Text(
                'About Secure Password',
                style: new TextStyle(
                  color: Color(0xFFDADADA),
                  fontFamily: 'PopinsR',
                  fontWeight: FontWeight.w600,
                  fontSize: 17,
                ),
              ),
            ),
          ),
          new FlatButton(
            highlightColor: Color(0xFF222222),
            splashColor: Color(0xFF444444),
            onPressed: () {},
            child: new ListTile(
              leading: new Text(
                'Donate',
                style: new TextStyle(
                  color: Color(0xFFDADADA),
                  fontFamily: 'PopinsR',
                  fontWeight: FontWeight.w600,
                  fontSize: 17,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
