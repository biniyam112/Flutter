import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:password_saver/models/userModel.dart';
import 'package:password_saver/screens/accountRecoverPage/recoverAccountPage.dart';
import 'package:password_saver/screens/homePage/home_page.dart';
import 'package:password_saver/screens/loginPage/exception_handler.dart';
import 'package:password_saver/screens/loginPage/signupPage.dart';
import 'package:password_saver/services/auth.dart';
import 'package:password_saver/widgets/loadingSpinner.dart';
import 'decelerate_animation.dart';
import 'loginButtonController.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginPage();
  }
}

class _LoginPage extends State {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  AuthService _authService = AuthService();
  bool _passwordObscured = true;
  bool _usernameFilled = false;
  bool _passwordFilled = false;
  String _password = '';
  String _email = '';
  bool _loading = false;
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomPadding: false,
      backgroundColor: Color(0xFF0D0C0D),
      body: DecelerateAnimation(
        delay: 0.6,
        child: new Container(
          decoration: new BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF3383CD),
                Color(0xFF11249F),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          alignment: Alignment.center,
          child: new Padding(
            padding: new EdgeInsets.symmetric(horizontal: 30),
            child: new IgnorePointer(
              ignoring: _loading,
              child: new Form(
                key: formKey,
                child: new Container(
                  constraints: new BoxConstraints(
                    maxHeight: MediaQuery.of(context).size.height * (4.5 / 6),
                  ),
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      new Padding(
                        padding: new EdgeInsets.fromLTRB(0, 20, 30, 20),
                        child: new Text(
                          'Secure\nPassword',
                          textAlign: TextAlign.center,
                          style: new TextStyle(
                            wordSpacing: 1,
                            color: Colors.white,
                            fontSize: 40,
                            fontFamily: 'popinsSB',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      new DecoratedBox(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0x44FFFFFF),
                        ),
                        child: new Padding(
                          padding: new EdgeInsets.symmetric(
                            horizontal: 8,
                          ),
                          child: new TextFormField(
                            validator: (String inputUsername) {
                              setState(() {});
                              return null;
                            },
                            onChanged: (inputUsername) {
                              setState(() {});
                              _email = inputUsername;
                              _usernameFilled =
                                  usernameValidator(inputUsername);
                              formKey.currentState.validate();
                            },
                            cursorColor: Colors.white,
                            style: new TextStyle(
                              color: Colors.white,
                            ),
                            cursorWidth: 1.3,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              hintText: 'username or email',
                              hintStyle: new TextStyle(
                                fontSize: 16,
                                color: Colors.white54,
                                fontFamily: 'Arial',
                              ),
                            ),
                          ),
                        ),
                      ),
                      new DecoratedBox(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0x44FFFFFF),
                        ),
                        child: new Padding(
                          padding: new EdgeInsets.symmetric(
                            horizontal: 8,
                          ),
                          child: new TextFormField(
                            validator: (String inputPassword) {
                              setState(() {});
                              return null;
                            },
                            onChanged: (inputPassword) {
                              _password = inputPassword;
                              _passwordFilled =
                                  passwordValidator(inputPassword).hasvalue;
                              formKey.currentState.validate();
                            },
                            obscureText: _passwordObscured,
                            cursorColor: Colors.white,
                            style: new TextStyle(
                              color: Colors.white,
                            ),
                            cursorWidth: 1.3,
                            decoration: InputDecoration(
                              suffixIcon: new GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _passwordObscured = !_passwordObscured;
                                    print(_passwordObscured);
                                  });
                                },
                                child: _passwordObscured
                                    ? new Icon(
                                        FontAwesomeIcons.solidEye,
                                        color: Colors.white54,
                                      )
                                    : new Icon(
                                        FontAwesomeIcons.solidEyeSlash,
                                        color: Colors.white54,
                                      ),
                              ),
                              border: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              hintText: 'Password',
                              hintStyle: new TextStyle(
                                fontSize: 16,
                                color: Colors.white54,
                                fontFamily: 'Arial',
                              ),
                            ),
                          ),
                        ),
                      ),
                      new ButtonTheme(
                        height: 48,
                        minWidth: double.infinity,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: new RaisedButton(
                          onPressed:
                              loginFieldFilled(_usernameFilled, _passwordFilled)
                                  ? () async {
                                      _scaffoldKey.currentState.showSnackBar(
                                        SnackBar(
                                          content: wave(),
                                          backgroundColor: Colors.green,
                                          elevation: 4,
                                        ),
                                      );
                                      setState(() {
                                        _loading = true;
                                      });
                                      try {
                                        var firebaseuser = await _authService
                                            .signInWithEmail(_email, _password);

                                        print('\n\nare you here\n\n');
                                        User user = _authService
                                            .authresultToUser(firebaseuser);
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
                                        _loading = false;
                                        print('\n\nit worked\n\n');
                                      } catch (exception) {
                                        setState(() {
                                          _loading = false;
                                        });
                                        print('\n\n$exception\n\n');
                                        _scaffoldKey.currentState.showSnackBar(
                                          SnackBar(
                                            content: new Text(
                                              loginExceptionMessage(exception),
                                              style: new TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                            backgroundColor: Color(0xFFAA1111),
                                            duration: Duration(seconds: 3),
                                            onVisible: () {
                                              setState(() {
                                                _loading = false;
                                              });
                                            },
                                          ),
                                        );
                                      }
                                    }
                                  : null,
                          child: new Text(
                            'Log In',
                            style: new TextStyle(
                              color: Colors.white,
                              fontFamily: 'Arial',
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
                            0x5F536DFF,
                            {
                              700: Color(0xFF304FFE),
                            },
                          ),
                          disabledElevation: 0,
                          elevation: 6,
                        ),
                      ),
                      new Padding(
                        padding: new EdgeInsets.symmetric(
                          vertical: 6,
                        ),
                        child: new GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return new RecoverAccount();
                              }),
                            );
                          },
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'forgot your login details? ',
                                  style: new TextStyle(
                                    color: Colors.white24,
                                    fontSize: 14,
                                  ),
                                ),
                                TextSpan(
                                  text: ' recover account.',
                                  style: new TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      new Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new Expanded(
                            child: new Divider(
                              color: Colors.white60,
                              height: 10,
                            ),
                          ),
                          new Container(
                            padding: new EdgeInsets.symmetric(
                              vertical: 4,
                              horizontal: 8,
                            ),
                            child: new Text(
                              'OR',
                              style: new TextStyle(
                                color: Colors.white60,
                                fontSize: 14,
                                letterSpacing: 1,
                              ),
                            ),
                          ),
                          new Expanded(
                            child: new Divider(
                              color: Colors.white60,
                              height: 10,
                            ),
                          ),
                        ],
                      ),
                      new Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          FlatButton.icon(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                              side: BorderSide(
                                color: MaterialColor(0xFFF44336, {
                                  900: Color(0xFFB71C1C),
                                }),
                              ),
                            ),
                            padding: new EdgeInsets.all(14),
                            onPressed: () {},
                            icon: Icon(
                              FontAwesomeIcons.google,
                              color: MaterialColor(
                                0xFFF44336,
                                {
                                  900: Color(0xFFB71C1C),
                                },
                              ),
                              size: 20,
                            ),
                            splashColor: MaterialColor(
                              0x6FF44336,
                              {
                                900: Color(0xFFB71C1C),
                              },
                            ),
                            label: new Text(
                              ' Google ',
                              style: new TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          FlatButton.icon(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                              side: BorderSide(
                                color: MaterialColor(
                                  0xFF2196F3,
                                  {
                                    900: Color(0xFF0D47A1),
                                  },
                                ),
                              ),
                            ),
                            padding: new EdgeInsets.all(14),
                            onPressed: () {},
                            icon: Icon(
                              FontAwesomeIcons.facebookF,
                              color: MaterialColor(
                                0xCF2196F3,
                                {
                                  900: Color(0xFF0D47A1),
                                },
                              ),
                            ),
                            focusColor: MaterialColor(
                              0xDF2196F3,
                              {
                                900: Color(0xAF0D47A1),
                              },
                            ),
                            splashColor: MaterialColor(
                              0x6F2196F3,
                              {
                                900: Color(0xFF0D47A1),
                              },
                            ),
                            label: new Text(
                              'Facebook',
                              style: new TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                      new Padding(
                        padding: new EdgeInsets.only(top: 20),
                        child: new Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            new GestureDetector(
                              onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SignUpPage(),
                                ),
                              ),
                              child: new RichText(
                                text: TextSpan(
                                  text: 'Don\'t have an account? ',
                                  style: new TextStyle(
                                    color: Colors.white38,
                                    fontSize: 16,
                                  ),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: ' Sign up',
                                      style: new TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
