import 'package:flutter/material.dart';

void main() => runApp(HomePage());

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'get you\'r shit togther',
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            flexibleSpace: Padding(
              padding: EdgeInsets.fromLTRB(0, 24, 0, 0),
              child: TabBar(
                tabs: <Widget>[
                  Tab(
                    icon: Icon(Icons.cake),
                    text: 'Birthdays',
                  ),
                  Tab(
                    icon: Icon(Icons.book),
                    text: 'Exams',
                  ),
                  Tab(
                    icon: Icon(Icons.schedule),
                    text: 'Appointements',
                  ),
                ],
              ),
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Center(
                    child: new Text('Birthdays'),
                  ),
                  FloatingActionButton(
                    child: Icon(
                      Icons.add,
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Center(
                    child: new Text('Exams'),
                  ),
                  FloatingActionButton(
                    child: Icon(
                      Icons.add,
                    ),
                    tooltip: 'add shedule',
                    onPressed: () {},
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Center(
                    child: new Text('Appointments'),
                  ),
                  FloatingActionButton(
                    child: Icon(
                      Icons.add,
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
