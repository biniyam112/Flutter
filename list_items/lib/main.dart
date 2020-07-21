import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

main(List<String> args) {
  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MainPage();
}

class _MainPage extends State {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          actions: <Widget>[
            new FlatButton.icon(
              onPressed: null,
              icon: Icon(
                Icons.monetization_on,
                color: Colors.white,
              ),
              label: new Text(''),
            ),
            new FlatButton.icon(
              onPressed: null,
              icon: Icon(
                Icons.insert_emoticon,
                color: Colors.white,
              ),
              label: new Text(''),
            ),
            new FlatButton.icon(
              onPressed: null,
              icon: Icon(
                Icons.iso,
                color: Colors.white,
              ),
              label: new Text(''),
            ),
          ],
        ),
        body: new ListView.builder(
          itemBuilder: (context, index) {
            return new Card(
              elevation: 4,
              child: ListTile(
                leading: new Icon(
                  FontAwesomeIcons.leanpub,
                  color: Colors.red,
                  size: 12,
                ),
                title: new Text(
                  'title area',
                ),
                subtitle: new Text(
                  'subtitle area',
                ),
                trailing: new Icon(
                  Icons.local_airport,
                ),
                selected: true,
              ),
            );
          },
          itemCount: 12,
          addAutomaticKeepAlives: true,
        ),
        drawer: new Container(
          color: Colors.black,
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              new CircularProgressIndicator(
                semanticsValue: 'value',
                // value: .4,
                semanticsLabel: 'label',
                strokeWidth: 10,
                backgroundColor: Colors.white,
                valueColor: new AlwaysStoppedAnimation(
                  Colors.deepOrange,
                ),
              ),
              new LinearProgressIndicator(
                semanticsLabel: 'semantics label',
                // value: .25,
                backgroundColor: Colors.white,
                semanticsValue: 'semantics value',
                valueColor: AlwaysStoppedAnimation(
                  Colors.pink,
                ),
              ),
              new Image.asset(
                'assets/image/naruto.jpg',
                height: 100,
                width: 200,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
