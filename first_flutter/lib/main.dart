import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage('Hello world'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  // MyHomePage(Key key, this.title) : super(key: key);
  MyHomePage(this.title);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () => _showDialogbox(context),
          child: Text('Hello worls the second'),
        ),
      ),
    );
  }

  _showDialogbox(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Text('title'),
            content: new Text('content'),
            actions: <Widget>[
              new FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: new Text('cancel'))
            ],
          );
        });
  }
}

