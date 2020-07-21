import 'package:flutter/material.dart';

main(List<String> args) {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: new AppBar(
          backgroundColor: Colors.white,
          title: new Text(
            'Dialog box',
            style: new TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
        body: new ListView(
          children: <Widget>[
            MainPage(),
          ],
        ),
      ),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MainPage();
  }
}

class _MainPage extends State {
  final GlobalKey scaffoldKey = new GlobalKey();

  @override
  Widget build(BuildContext context) {
    _showIt() {
      Scaffold.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          duration: Duration(seconds: 5),
          content: Text("I like pie!"),
          action: SnackBarAction(
            label: "Chow down",
            onPressed: () {
              print("Gettin' fat!");
            },
          ),
        ),
      );
    }

    _showSnacBar() {
      Scaffold.of(context).showSnackBar(
        new SnackBar(
          content: new Row(
            children: <Widget>[
              Padding(
                padding: new EdgeInsets.fromLTRB(2, 0, 10, 0),
                child: new Icon(Icons.slideshow),
              ),
              new Text(
                'this will show the snacbar item',
                style: new TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
          // animation: CurvedAnimation(
          //   curve: Curves.bounceIn,
          //   parent: null,
          //   reverseCurve: Curves.bounceOut,
          // ),
          backgroundColor: Colors.black,
          duration: Duration(seconds: 5),
          onVisible: () {
            print('the snacbar is visible!');
          },
          action: SnackBarAction(
            onPressed: () {
              print('Onpressed by snacbar action!');
            },
            label: 'this is the label',
            disabledTextColor: Colors.white,
          ),
        ),
      );
    }

    _showModalBottomSheet() {
      showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return new Theme(
            data: ThemeData(
              backgroundColor: Colors.black,
              accentColor: Colors.white,
              textSelectionColor: Colors.white,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                new Padding(
                  padding: new EdgeInsets.all(10),
                  child: new Text('What do you want to be?'),
                ),
                new FlatButton.icon(
                  color: Theme.of(context).accentColor,
                  onPressed: () {
                    print('Programmer');
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.keyboard_hide),
                  label: new Opacity(
                    opacity: 0.5,
                    child: new Text(
                      'Programmer',
                      style: Theme.of(context).textTheme.subtitle,
                    ),
                  ),
                ),
                new FlatButton.icon(
                  color: Theme.of(context).accentColor,
                  onPressed: () {
                    print('Hacker');

                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.vpn_lock),
                  label: new Text(
                    'Hacker',
                    style: Theme.of(context).textTheme.subtitle,
                  ),
                ),
                new FlatButton.icon(
                  color: Theme.of(context).accentColor,
                  onPressed: () {
                    print('Writter');
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.book),
                  label: new Text(
                    'Writter',
                    style: Theme.of(context).textTheme.subtitle,
                  ),
                ),
              ],
            ),
          );
        },
      );
    }

    Future _display() async {
      switch (await showDialog(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: new Text(
              'What do you want to be?',
            ),
            children: <Widget>[
              new SimpleDialogOption(
                child: new Text(
                  'Programmer',
                ),
                onPressed: () {
                  Navigator.pop(context, 'Programmer');
                },
              ),
              new SimpleDialogOption(
                child: new Text(
                  'Hacker',
                ),
                onPressed: () {
                  Navigator.pop(context, 'Hacker');
                },
              ),
              new SimpleDialogOption(
                child: new Text(
                  'Writter',
                ),
                onPressed: () {
                  Navigator.pop(context, 'Writter');
                },
              ),
            ],
          );
        },
      )) {
        case 'Programmer':
          print('Programmer');
          break;
        case 'Hacker':
          print('Hacker');
          break;
        case 'Writter':
          print('Writter');
          break;
      }
    }

    return Center(
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          new Transform(
            alignment: Alignment.center,
            transform: Matrix4.skewY(0.0)
              ..rotateZ(3.15)
              ..rotateX(3.3)
              ..rotateY(-6.2),
            child: new Container(
              color: Colors.yellow,
              child: new Padding(
                padding: new EdgeInsets.all(20),
                child:
                    new Text('This is a test of how smart you are since the '),
              ),
            ),
          ),
          new Transform(
            alignment: Alignment.center,
            transform: Matrix4.skewY(0.0)
              ..rotateZ(-3.14)
              ..rotateX(0)
              ..rotateY(0),
            // transform:Matrix4.skewY(0.0)
            //   ..rotateZ(-3.14)
            //   ..rotateX(3)
            //   ..rotateY(0),
            // transform:Matrix4.skewY(0.0)
            // ..rotateZ(3.14)
            // ..rotateX(0)
            // ..rotateY(3),
            // transform:Matrix4.skewY(0.0)
            // ..rotateZ(0)
            // ..rotateX(3.12)
            // ..rotateY(3),

            child: new Container(
              color: Colors.yellow,
              child: new Padding(
                padding: new EdgeInsets.all(20),
                child:
                    new Text('This is a test of how smart you are since the '),
              ),
            ),
          ),
          new DecoratedBox(
            decoration: BoxDecoration(
              gradient: new LinearGradient(
                colors: [Colors.blue, Colors.deepOrange],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                tileMode: TileMode.repeated,
              ),
            ),
            child: new RaisedButton(
              child: new Text(
                "Display",
              ),
              onPressed: () {
                // _display();
                _showSnacBar();
                _showModalBottomSheet();
                _showIt();
              },
            ),
          ),
          SimpleDialog(
            elevation: 4,
            children: <Widget>[
              new Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 7,
                      spreadRadius: 0,
                      color: Colors.white54,
                    )
                  ],
                ),
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    new Text(
                      '12',
                      style: new TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    new Text(
                      'high score',
                      style: new TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    new Padding(
                      padding: new EdgeInsets.fromLTRB(0, 15, 0, 0),
                      child: new Container(
                        constraints:
                            BoxConstraints.expand(height: 60, width: 100),
                        decoration: BoxDecoration(),
                        child: new RaisedButton(
                          animationDuration: Duration(milliseconds: 500),
                          color: MaterialColor(0xFF4CAF50, {
                            700: Color(0xFF388E3C),
                          }),
                          hoverElevation: 4,
                          hoverColor: MaterialColor(0xFF4CAF50, {
                            900: Color(0xFF1B5E20),
                          }),
                          child: Icon(
                            Icons.play_arrow,
                            color: Colors.white,
                            size: 46,
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Center(
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                AnimatedContainer(
                  color: _color,
                  height: _dimention,
                  width: _dimention,
                  duration: Duration(
                    seconds: 2,
                  ),
                  child: new Text(
                    'Animator',
                    style: new TextStyle(
                      color: _color,
                    ),
                  ),
                ),
                new RaisedButton(
                  onPressed: () {
                    controller++;
                    if (controller % 2 == 1) {
                      _color = Colors.green;
                      _dimention = 200;
                    } else {
                      _color = Colors.yellow;
                      _dimention = 100;
                    }
                    if (_state == true)
                      _state = false;
                    else
                      _state = true;

                    setState(() {});
                  },
                  child: new Icon(
                    Icons.android,
                    color: Colors.green,
                    size: _half,
                  ),
                ),
                new AnimatedCrossFade(
                  firstChild: new FlutterLogo(
                    style: FlutterLogoStyle.horizontal,
                    size: _dimention,
                  ),
                  secondChild: new FlutterLogo(
                    style: FlutterLogoStyle.stacked,
                    size: _dimention,
                  ),
                  crossFadeState: _state
                      ? CrossFadeState.showFirst
                      : CrossFadeState.showSecond,
                  duration: Duration(
                    seconds: 2,
                  ),
                )
              ],
            ),
          ),
          new Draggable(
            child: new Text('this is draggable item'),
            feedback: new Text(
              'already dragged',
              style: new TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
            ),
          ),
          new Padding(
            padding: new EdgeInsets.all(20),
            child: new DragTarget(
              builder: (context, accepted, rejected) {
                return new Container(
                  width: _dimention,
                  height: _dimention,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey,
                  ),
                );
              },
              onAccept: (data) {
                print('\n\nthis is the data: $data\n\n');
              },
            ),
          ),
          new Padding(
            padding: new EdgeInsets.all(10),
            child: new Table(
              border: new TableBorder.all(
                width: 1,
                color: Colors.black,
                style: BorderStyle.solid,
              ),
              children: [
                TableRow(
                  decoration: new BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      12,
                    ),
                    shape: BoxShape.circle,
                  ),
                  children: [
                    new Center(
                      child: new Text(
                        '1',
                      ),
                    ),
                    new Center(
                      child: new Text(
                        '2',
                      ),
                    ),
                    new Center(
                      child: new Text(
                        '3',
                      ),
                    ),
                    new Center(
                      child: new Text(
                        '4',
                      ),
                    ),
                  ],
                ),
                TableRow(
                  children: [
                    new Center(
                      child: new Text(
                        'a',
                      ),
                    ),
                    new Center(
                      child: new Text(
                        'a',
                      ),
                    ),
                    new Center(
                      child: new Text(
                        'a',
                      ),
                    ),
                    new Center(
                      child: new Text(
                        'a',
                      ),
                    ),
                  ],
                ),
                // new TableRow(children: [
                //   new Row(
                //     children: <Widget>[
                //       new Center(
                //         child: new Text(
                //           'a',
                //         ),
                //       ),
                //       new Center(
                //         child: new Text(
                //           'a',
                //         ),
                //       ),
                //       new Center(
                //         child: new Text(
                //           'a',
                //         ),
                //       ),
                //       new Center(
                //         child: new Text(
                //           'a',
                //         ),
                //       ),
                //     ],
                //   )
                // ],),
              ],
            ),
          ),
        ],
      ),
    );
  }

  MaterialColor _color = Colors.yellow;
  static double _dimention = 100;
  static double _half = _dimention / 2;
  int controller = 0;
  bool _state = true;
}
