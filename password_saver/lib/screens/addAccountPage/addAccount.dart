import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:password_saver/models/userModel.dart';
import 'package:password_saver/screens/addAccountPage/accountFieldValidator.dart';
import 'package:password_saver/screens/homePage/home_page.dart';
import 'package:password_saver/services/firestoreService.dart';
import 'package:password_saver/widgets/loadingSpinner.dart';

class AddAccount extends StatefulWidget {
  final User user;
  AddAccount({Key key, @required this.user}) : super(key: key);

  @override
  _AddAccountState createState() => _AddAccountState(user: user);
}

class _AddAccountState extends State<AddAccount> {
  final User user;
  _AddAccountState({@required this.user});
  var _formKey = new GlobalKey<FormState>();
  var _scaffoldKey = new GlobalKey<ScaffoldState>();
  DatabaseHandler _databaseHandler;
  String _accountName;
  String _email;
  String _password;
  String _description;
  bool _passwordObscured = true;
  bool _accNamefilled = false;
  bool _passwordFilled = false;
  bool _loading = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        key: _scaffoldKey,
        body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: new BoxDecoration(
              color: Color(0xFF1E1D1E),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                new Container(
                  height: MediaQuery.of(context).size.height / 3,
                  width: MediaQuery.of(context).size.width,
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      // the real deal
                      Padding(
                        padding: new EdgeInsets.only(
                          top: 26,
                        ),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: IconButton(
                            color: Colors.white,
                            icon: Icon(
                              Icons.arrow_back_ios,
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                      ),

                      SizedBox(
                        height: 20,
                      ),
                      new Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          new Padding(
                            padding: new EdgeInsets.only(),
                            child: new SvgPicture.asset(
                              'assets/images/privacy.svg',
                              width: 100,
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                          new Text(
                            'never lose your \npassword again.\nall in one place',
                            style: new TextStyle(
                              fontFamily: 'popinsB',
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                // ),
                // this is where the text forms exist
                new Container(
                  height: MediaQuery.of(context).size.height * (2 / 3),
                  width: MediaQuery.of(context).size.width,
                  child: new IgnorePointer(
                    ignoring: _loading,
                    child: new Form(
                      key: _formKey,
                      child: new Padding(
                        padding: new EdgeInsets.symmetric(
                          horizontal: 26,
                        ),
                        child: new Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            new Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                new Padding(
                                  padding: new EdgeInsets.only(right: 10),
                                  child: new Icon(
                                    Icons.devices,
                                    color: Color(0xFF3383CD),
                                  ),
                                ),
                                Expanded(
                                  child: TextField(
                                    onChanged: (inputAccount) {
                                      _accountName = inputAccount;
                                      setState(() {
                                        _accNamefilled =
                                            passwordValidate(inputAccount);
                                      });
                                    },
                                    style: new TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'popinsR',
                                      fontSize: 18,
                                      letterSpacing: 0.4,
                                    ),
                                    decoration: InputDecoration(
                                      hintText: 'account name',
                                      hintStyle: new TextStyle(
                                        fontSize: 16,
                                        color: Colors.white70,
                                        fontFamily: 'popinsR',
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            new Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                new Padding(
                                  padding: new EdgeInsets.only(right: 10),
                                  child: new Icon(
                                    Icons.alternate_email,
                                    color: Color(0xFF3383CD),
                                  ),
                                ),
                                Expanded(
                                  child: TextField(
                                    style: new TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'popinsR',
                                      fontSize: 18,
                                      letterSpacing: 0.4,
                                    ),
                                    onChanged: (inputEmail) {
                                      _email = inputEmail;
                                    },
                                    decoration: InputDecoration(
                                      hintText: 'email',
                                      hintStyle: new TextStyle(
                                        fontSize: 16,
                                        color: Colors.white70,
                                        fontFamily: 'popinsR',
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            new Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                new Padding(
                                  padding: new EdgeInsets.only(right: 10),
                                  child: new Icon(
                                    Icons.lock_open,
                                    color: Color(0xFF3383CD),
                                  ),
                                ),
                                Expanded(
                                  child: TextField(
                                    style: new TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'popinsR',
                                      fontSize: 18,
                                      letterSpacing: 0.4,
                                    ),
                                    onChanged: (inputPassword) {
                                      _password = inputPassword;
                                      setState(() {
                                        _passwordFilled =
                                            passwordValidate(inputPassword);
                                      });
                                    },
                                    decoration: InputDecoration(
                                      suffixIcon: new GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            _passwordObscured =
                                                !_passwordObscured;
                                            print(_passwordObscured);
                                          });
                                        },
                                        child: _passwordObscured
                                            ? new Icon(
                                                FontAwesomeIcons.solidEye,
                                                color: Colors.white,
                                              )
                                            : new Icon(
                                                FontAwesomeIcons.solidEyeSlash,
                                                color: Colors.white,
                                              ),
                                      ),
                                      hintText: 'password',
                                      hintStyle: new TextStyle(
                                        fontSize: 16,
                                        color: Colors.white70,
                                        fontFamily: 'popinsR',
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            new Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                new Padding(
                                  padding: new EdgeInsets.only(right: 10),
                                  child: new Icon(
                                    Icons.details,
                                    color: Color(0xFF3383CD),
                                  ),
                                ),
                                Expanded(
                                  child: TextField(
                                    style: new TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'popinsR',
                                      fontSize: 18,
                                      letterSpacing: 0.4,
                                    ),
                                    onChanged: (inputDescription) {
                                      _description = inputDescription;
                                    },
                                    decoration: InputDecoration(
                                      hintText: 'description',
                                      hintStyle: new TextStyle(
                                        fontSize: 16,
                                        color: Colors.white70,
                                        fontFamily: 'popinsR',
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            new Padding(
                              padding: new EdgeInsets.symmetric(
                                vertical: 20,
                              ),
                              child: new ButtonTheme(
                                height: 48,
                                minWidth:
                                    MediaQuery.of(context).size.width - 100,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: new RaisedButton(
                                  onPressed: (_accNamefilled && _passwordFilled)
                                      ? () async {
                                          print('\n\n\nclicked\n\n\n');
                                          setState(() {
                                            _loading = true;
                                          });
                                          _scaffoldKey.currentState
                                              .showSnackBar(
                                            SnackBar(
                                              content: wave(),
                                              backgroundColor: Colors.white,
                                            ),
                                          );
                                          _databaseHandler =
                                              new DatabaseHandler(
                                                  uid: user.userId);
                                          print('\n\n\nhere\n\n\n');
                                          try {
                                            DateTime timeNow = DateTime.now();
                                            String formattedTime =
                                                DateFormat('yyyy-MMM-dd')
                                                    .format(timeNow);
                                            _databaseHandler.updateUserData(
                                                _accountName,
                                                _email,
                                                _password,
                                                formattedTime,
                                                _description);
                                            print('\n\n\nno error\n\n\n');
                                            _loading = false;
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) {
                                                  return HomePage(
                                                    user: user,
                                                  );
                                                },
                                              ),
                                            );
                                            print('\n\nit worked\n\n');
                                          } catch (exception) {
                                            setState(() {
                                              _loading = false;
                                              print('\n\ndidn\'t worked\n\n');
                                              _scaffoldKey.currentState
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: new Text(
                                                    exception,
                                                    style: new TextStyle(
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                  backgroundColor: Colors.white,
                                                  onVisible: () {
                                                    setState(() {
                                                      _loading = false;
                                                    });
                                                  },
                                                ),
                                              );
                                            });
                                          }
                                        }
                                      : null,
                                  child: new Text(
                                    'Add account',
                                    style: new TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'popinsR',
                                      fontSize: 15,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  color: MaterialColor(
                                    0xFF536DFE,
                                    {
                                      700: Color(0xFF304FFE),
                                    },
                                  ),
                                  disabledColor: MaterialColor(
                                    0x5F536DFE,
                                    {
                                      700: Color(0xFF304FFE),
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
