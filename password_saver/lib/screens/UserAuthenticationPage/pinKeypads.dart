import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:password_saver/screens/UserAuthenticationPage/pinchecker.dart';
import 'package:password_saver/screens/homePage/home_page.dart';
import 'package:password_saver/wrapper.dart';

class PinPads extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _PinPads();
  }
}

class _PinPads extends State {
  static String inputCode = '';
  List<String> inputCodeList = new List();
  final TextEditingController textEditingController =
      new TextEditingController();
  final formKey = GlobalKey<FormState>();
  void _textFieldDisplay(String number) {
    if (number == '_') {
      // remove last input
      if (inputCodeList.length > 0) {
        inputCodeList.removeLast();
        inputCode = inputCodeList.join();
      }
    } else if (number == ' ') {
      inputCode = '';
      inputCodeList = [];
    } else {
      inputCodeList.add(number);
      inputCode = inputCodeList.join();
    }
    textEditingController.text = inputCode;
    formKey.currentState.validate();
  }

  Widget newPad() {
    return Container(
      padding: new EdgeInsets.symmetric(horizontal: 30),
      height: MediaQuery.of(context).size.width * 1.2,
      child: new GridView.count(
        crossAxisCount: 3,
        childAspectRatio: 1.1,
        children: new List.generate(
          12,
          (index) {
            return padItem(
              (index + 1).toString(),
            );
          },
        ),
      ),
    );
  }

  Widget padItem(String padvalue) {
    if (int.parse(padvalue) > 9) {
      return iconPadItem(padvalue);
    } else
      return numberPadItem(padvalue);
  }

  Widget iconPadItem(String padvalue) {
    if (padvalue == '10') {
      return new Text('data');
    } else if (padvalue == '11') {
      return numberPadItem('0');
    } else {
      return CircleAvatar(
        radius: 70,
        backgroundColor: Colors.black,
        child: FlatButton(
          onPressed: () {
            _textFieldDisplay('_');
            setState(() {});
          },
          splashColor: Colors.white30,
          padding: new EdgeInsets.all(10),
          child: new Icon(
            Icons.backspace,
            color: Colors.white,
          ),
        ),
      );
    }
  }

  Widget numberPadItem(String padValue) {
    return new CircleAvatar(
      radius: 70,
      backgroundColor: Colors.black,
      child: FlatButton(
        onPressed: () {
          _textFieldDisplay(padValue);
          setState(() {});
        },
        shape: CircleBorder(),
        splashColor: Colors.white30,
        padding: new EdgeInsets.all(10),
        child: new Text(
          padValue,
          style: new TextStyle(
            fontSize: 46,
            color: Colors.white,
            fontWeight: FontWeight.w300,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        new Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            new Padding(
              padding: new EdgeInsets.all(10),
              child: Icon(
                FontAwesomeIcons.puzzlePiece,
                color: Colors.white,
                size: 46,
              ),
            ),
            new Padding(
              padding: new EdgeInsets.all(10),
              child: new Text(
                'Enter your passcode',
                style: new TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
            ),
            new Padding(
              padding: new EdgeInsets.all(10),
              child: new SizedBox(
                height: 40,
                width: MediaQuery.of(context).size.width * 0.3,
                child: new Form(
                  key: formKey,
                  child: new TextFormField(
                    autofocus: true,
                    showCursor: false,
                    obscureText: true,
                    controller: textEditingController,
                    enabled: false,
                    decoration: InputDecoration(
                      errorStyle: TextStyle(
                        color: Colors.red,
                        fontSize: 14,
                      ),
                      contentPadding: new EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                    ),
                    style: new TextStyle(
                      color: Colors.white,
                      fontSize: 36,
                      fontWeight: FontWeight.w300,
                      letterSpacing: 2,
                    ),
                    validator: (String passcode) {
                      if (passcode.length == 4) {
                        if (correctPin(passcode)) {
                          Navigator.pop(context);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return Wrapper();
                              },
                            ),
                          );
                        } else {
                          _textFieldDisplay(' ');
                          return 'incorrect pin';
                        }
                      }
                      return null;
                    },
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ],
        ),
        Divider(
          color: Colors.white30,
        ),
        newPad(),
      ],
    );
  }
}
