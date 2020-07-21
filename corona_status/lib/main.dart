import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'corona status',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'COVID 19 status'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);


  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Open Browser'),
          onPressed: _openBrowser,
        ),
      ),
    );
  }


  static const platform = const MethodChannel('worldometers.info/coronavirus/');
//  https://www.worldometers.info/coronavirus/
//  flutterapp.tutorialspoint.com/browser

  Future<void> _openBrowser() async{
    try{
      final int result = await platform.invokeMethod('openBrowser',<String,String>{
        'url':'https://www.worldometers.info/coronavirus/'
//        https://flutter.dev
      });
      print(result);
    }
    on PlatformException catch(e){
      print(e);
    }
  }

}
