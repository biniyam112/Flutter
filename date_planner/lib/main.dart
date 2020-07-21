import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Time Planner',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainPage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MainPage extends StatelessWidget {
  Future<DateTime> _showDatePicker(context) async {
    DateTime dateTime = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2050),
    );
    return dateTime;
  }

  Future<TimeOfDay> _showTimePicker(context) async {
    TimeOfDay timeOfDay = await showTimePicker(
      initialTime: TimeOfDay.now(),
      context: context,
    );
    return timeOfDay;
  }

  final String title;
  MainPage({this.title});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: new AppBar(
          title: new Text(title),
        ),
        body: new Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              new RaisedButton(
                onPressed: () => _showDatePicker(context),
                child: new Text('show Date'),
              ),
              new RaisedButton(
                onPressed: () => _showTimePicker(context),
                child: new Text('show time'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
