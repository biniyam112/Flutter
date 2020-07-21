import 'package:flutter/material.dart';

main() {
  runApp(HomePage());
}

class HomePage extends StatelessWidget {
  // HomePage({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: <String, WidgetBuilder>{
        '/about_us': (BuildContext context) => AboutUs(title: 'About as'),
      },
      title: 'From scratch',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter Playground'),
        ),
        drawer: Drawer(
          child: GestureDetector(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text('User account'),
                Text('Settings'),
                Text('theme'),
                new Text('about me'),
              ],
            ),
            onTap: () => Navigator.pushNamed(context, '/about_us'),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              GestureDetector(
                child: Card(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(2, 12, 2, 12),
                    child: Text(
                      'the body of the application and I\'m purposefully trying to create overflow',
                      overflow: TextOverflow.visible,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (BuildContext context) {
                    return AboutUs(title: 'About us');
                  }),
                ),
              ),
              Divider(),
              ConstrainedBox(
                constraints: BoxConstraints(minWidth: 20),
                child: FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Text(
                    'Actual text comming soon',
                    overflow: TextOverflow.visible,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Divider(),
              RotatedBox(
                quarterTurns: 3,
                child: new Text('this is for the rotated box'),
              ),
              Divider(),
              SizedBox(
                child: new Text(
                  'this is the sized(zzz)ed box',
                  overflow: TextOverflow.visible,
                  textAlign: TextAlign.center,
                ),
              ),
              FloatingActionButton(
                child: Icon(Icons.navigate_next),
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute<void>(builder: (BuildContext context) {
                    return Scaffold(
                      appBar: AppBar(
                        title: Text('About us'),
                      ),
                      body: Center(
                        child: Text('this is the body!'),
                      ),
                    );
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AboutUs extends StatelessWidget {
  final String title;
  AboutUs({this.title});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Playground',
      home: Scaffold(
        appBar: AppBar(
          title: new Text(title),
        ),
        body: Column(
          children: <Widget>[
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Expanded(
                child: new Text(
                    'what do you want to know about as? \n Nothing so get the hell out of here!'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
