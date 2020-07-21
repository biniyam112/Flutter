import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

main() => runApp(MainPage());

class MainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MainPage();
  }
}

class _MainPage extends State {
  void initState() {
    super.initState();
    restore();
  }

  restore() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    sharedPreferences.getInt('page');
  }

  getPage(int pageState) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    sharedPreferences.setInt('page', _currentPage);
  }

  Widget _pages(int index) {
    if (index == 0) {
      return Study();
    } else if (index == 1) {
      return Workout();
    } else if (index == 2) {
      return Spritify();
    } else
      return null;
  }

  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.black,
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
            title: Text(
              'Planner',
              style: TextStyle(
                color: Colors.white,
                fontStyle: FontStyle.italic,
                fontSize: 18,
              ),
            ),
          ),
          bottomNavigationBar: new BottomNavigationBar(
            items: [
              new BottomNavigationBarItem(
                icon: Icon(Icons.book),
                title: new Text('read'),
              ),
              new BottomNavigationBarItem(
                icon: Icon(Icons.line_weight),
                title: new Text('work out'),
              ),
              new BottomNavigationBarItem(
                icon: Icon(Icons.bookmark),
                title: new Text('Spritify'),
              ),
            ],
            currentIndex: _currentPage,
            onTap: (index) {
              setState(() {
                _currentPage = index;
                getPage(_currentPage);
              });
            },
          ),
          body: _pages(_currentPage)),
    );
  }
}

class Study extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Study();
  }
}

class Workout extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Workout();
  }
}

class Spritify extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Spritify();
  }
}

int validateMonth(int days) {
  if (days > 30) {
    return 30 - (days % 30);
  }
  return 30 - days;
}

int getMonths(int days) {
  return (days / 30).truncate();
}

class _Study extends State {
  int _currentStep = 0;
  int _daysCompeleted = 0;

  void initState() {
    super.initState();
    _restore();
  }

  _restore() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    setState(() {
      _currentStep = sharedPreferences.getInt('Studstate') ?? _currentStep;
      _daysCompeleted = sharedPreferences.getInt('Studdays') ?? _daysCompeleted;
    });
  }

  _saveCurrentState(int currentState) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setInt('Studstate', currentState);
    sharedPreferences.setInt('Studdays', _daysCompeleted);
  }

  _dailyMissionCompleted() {
    _daysCompeleted++;
    _currentStep = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        new Expanded(
          child: Stepper(
            type: StepperType.vertical,
            currentStep: _currentStep,
            onStepContinue: _currentStep > 3
                ? () => setState(() {
                      _dailyMissionCompleted();
                      _saveCurrentState(_currentStep);
                    })
                : () => setState(() {
                      _currentStep++;
                      _saveCurrentState(_currentStep);
                    }),
            onStepCancel: () => setState(() {
              _currentStep = 0;
              _saveCurrentState(_currentStep);
            }),
            steps: [
              new Step(
                title: new Padding(
                  padding: EdgeInsets.fromLTRB(20, 2, 0, 2),
                  child: new Text(
                    'Start study',
                    style: new TextStyle(fontSize: 16),
                  ),
                ),
                content: new Text(
                  'ready for your daily mission?',
                  style: new TextStyle(fontSize: 18),
                ),
                isActive: _currentStep == 0 ? true : false,
              ),
              new Step(
                title: new Padding(
                  padding: EdgeInsets.fromLTRB(20, 2, 0, 2),
                  child: new Text(
                    '3 hours to go',
                    style: new TextStyle(fontSize: 16),
                  ),
                ),
                content: new Text(
                  'already done with the one hour',
                  style: new TextStyle(fontSize: 18),
                ),
                isActive: _currentStep == 1 ? true : false,
              ),
              new Step(
                title: new Padding(
                  padding: EdgeInsets.fromLTRB(20, 2, 0, 2),
                  child: new Text(
                    '2 hours to go',
                    style: new TextStyle(fontSize: 16),
                  ),
                ),
                content: new Text(
                  'half way through',
                  style: new TextStyle(fontSize: 18),
                ),
                isActive: _currentStep == 2 ? true : false,
              ),
              new Step(
                title: new Padding(
                  padding: EdgeInsets.fromLTRB(20, 2, 0, 2),
                  child: new Text(
                    '1 hour to go',
                    style: new TextStyle(fontSize: 16),
                  ),
                ),
                content: new Text(
                  'making through it',
                  style: new TextStyle(fontSize: 18),
                ),
                isActive: _currentStep == 3 ? true : false,
              ),
              new Step(
                title: new Padding(
                  padding: EdgeInsets.fromLTRB(20, 2, 0, 2),
                  child: new Text(
                    'Completed Study!',
                    style: new TextStyle(fontSize: 16),
                  ),
                ),
                content: new Text(
                  'mission completed you can watch movie now',
                  style: new TextStyle(fontSize: 18),
                ),
                isActive: _currentStep == 4 ? true : false,
              ),
            ],
          ),
        ),
        new Center(
          child: ListTile(
            leading: new Text(
              _daysCompeleted.toString(),
              style: TextStyle(
                fontSize: 30,
                fontStyle: FontStyle.italic,
              ),
              textAlign: TextAlign.center,
            ),
            title: new Text('${validateMonth(_daysCompeleted)} days to go'),
            subtitle: new Text('this is one month plan'),
            trailing: new Text(
              getMonths(_daysCompeleted).toString(),
              style: TextStyle(
                fontSize: 30,
                fontStyle: FontStyle.italic,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}

class _Workout extends State {
  int _currentStep = 0;
  int _daysCompeleted = 0;

  void initState() {
    super.initState();
    _restore();
  }

  _restore() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    setState(() {
      _currentStep = sharedPreferences.getInt('Worstate') ?? _currentStep;
      _daysCompeleted = sharedPreferences.getInt('Wordays') ?? _daysCompeleted;
    });
  }

  _saveCurrentState(int currentState) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setInt('Worstate', currentState);
    sharedPreferences.setInt('Wordays', _daysCompeleted);
  }

  _dailyMissionCompleted() {
    _daysCompeleted++;
    _currentStep = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        new Expanded(
          child: Stepper(
            type: StepperType.vertical,
            currentStep: _currentStep,
            onStepContinue: _currentStep > 4
                ? () => setState(() {
                      _dailyMissionCompleted();
                      _saveCurrentState(_currentStep);
                    })
                : () => setState(() {
                      _currentStep++;
                      _saveCurrentState(_currentStep);
                    }),
            onStepCancel: () => setState(() {
              _currentStep = 0;
              _saveCurrentState(_currentStep);
            }),
            steps: [
              new Step(
                title: new Padding(
                  padding: EdgeInsets.fromLTRB(20, 2, 0, 2),
                  child: new Text(
                    'Chest',
                    style: new TextStyle(fontSize: 16),
                  ),
                ),
                content: new Text(
                  'need to make it big!',
                  style: new TextStyle(fontSize: 18),
                ),
                isActive: _currentStep == 0 ? true : false,
              ),
              new Step(
                title: new Padding(
                  padding: EdgeInsets.fromLTRB(20, 2, 0, 2),
                  child: new Text(
                    'Triceps',
                    style: new TextStyle(fontSize: 16),
                  ),
                ),
                content: new Text(
                  'Main part of the hand',
                  style: new TextStyle(fontSize: 18),
                ),
                isActive: _currentStep == 1 ? true : false,
              ),
              new Step(
                title: new Padding(
                  padding: EdgeInsets.fromLTRB(20, 2, 0, 2),
                  child: new Text(
                    'Shoulders',
                    style: new TextStyle(fontSize: 16),
                  ),
                ),
                content: new Text(
                  'wanna look good in shirts?',
                  style: new TextStyle(fontSize: 18),
                ),
                isActive: _currentStep == 2 ? true : false,
              ),
              new Step(
                title: new Padding(
                  padding: EdgeInsets.fromLTRB(20, 2, 0, 2),
                  child: new Text(
                    'Biceps',
                    style: new TextStyle(fontSize: 16),
                  ),
                ),
                content: new Text(
                  'Ma favorite',
                  style: new TextStyle(fontSize: 18),
                ),
                isActive: _currentStep == 3 ? true : false,
              ),
              new Step(
                title: new Padding(
                  padding: EdgeInsets.fromLTRB(20, 2, 0, 2),
                  child: new Text(
                    'Abs',
                    style: new TextStyle(fontSize: 16),
                  ),
                ),
                content: new Text(
                  'lets see how far you can push your self',
                  style: new TextStyle(fontSize: 18),
                ),
                isActive: _currentStep == 4 ? true : false,
              ),
              new Step(
                title: new Padding(
                  padding: EdgeInsets.fromLTRB(20, 2, 0, 2),
                  child: new Text(
                    'Workout completed!',
                    style: new TextStyle(fontSize: 16),
                  ),
                ),
                content: new Text(
                  'mission completed you can watch movie now ;)',
                  style: new TextStyle(fontSize: 18),
                ),
                isActive: _currentStep == 5 ? true : false,
              ),
            ],
          ),
        ),
        new Center(
          child: ListTile(
            leading: new Text(
              _daysCompeleted.toString(),
              style: TextStyle(
                fontSize: 30,
                fontStyle: FontStyle.italic,
              ),
              textAlign: TextAlign.center,
            ),
            title: new Text('${validateMonth(_daysCompeleted)} days to go'),
            subtitle: new Text('this is one month plan'),
            trailing: new Text(
              getMonths(_daysCompeleted).toString(),
              style: TextStyle(
                fontSize: 30,
                fontStyle: FontStyle.italic,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}

class _Spritify extends State {
  int _currentStep = 0;
  int _daysCompeleted = 0;

  void initState() {
    super.initState();
    _restore();
  }

  _restore() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    setState(() {
      _currentStep = sharedPreferences.getInt('Sprstate') ?? _currentStep;
      _daysCompeleted = sharedPreferences.getInt('Sprdays') ?? _daysCompeleted;
    });
  }

  _saveCurrentState(int currentState) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setInt('Sprstate', currentState);
    sharedPreferences.setInt('Sprdays', _daysCompeleted);
  }

  _dailyMissionCompleted() {
    _daysCompeleted++;
    _currentStep = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        new Expanded(
          child: Stepper(
            type: StepperType.vertical,
            currentStep: _currentStep,
            onStepContinue: _currentStep > 2
                ? () => setState(() {
                      _dailyMissionCompleted();
                      _saveCurrentState(_currentStep);
                    })
                : () => setState(() {
                      _currentStep++;
                      _saveCurrentState(_currentStep);
                    }),
            onStepCancel: () => setState(() {
              _currentStep = 0;
              _saveCurrentState(_currentStep);
            }),
            steps: [
              new Step(
                title: new Padding(
                  padding: EdgeInsets.fromLTRB(20, 2, 0, 2),
                  child: new Text(
                    'Read Bible',
                    style: new TextStyle(fontSize: 16),
                  ),
                ),
                content: new Text(
                  'word of God',
                  style: new TextStyle(fontSize: 18),
                ),
                isActive: _currentStep == 0 ? true : false,
              ),
              new Step(
                title: new Padding(
                  padding: EdgeInsets.fromLTRB(20, 2, 0, 2),
                  child: new Text(
                    'Prayer',
                    style: new TextStyle(fontSize: 16),
                  ),
                ),
                content: new Text(
                  'Connect with the creator',
                  style: new TextStyle(fontSize: 18),
                ),
                isActive: _currentStep == 1 ? true : false,
              ),
              new Step(
                title: new Padding(
                  padding: EdgeInsets.fromLTRB(20, 2, 0, 2),
                  child: new Text(
                    'Meditate',
                    style: new TextStyle(fontSize: 16),
                  ),
                ),
                content: new Text(
                  'Connect your mind and body',
                  style: new TextStyle(fontSize: 18),
                ),
                isActive: _currentStep == 2 ? true : false,
              ),
              new Step(
                title: new Padding(
                  padding: EdgeInsets.fromLTRB(20, 2, 0, 2),
                  child: new Text(
                    'Mission completed!',
                    style: new TextStyle(fontSize: 16),
                  ),
                ),
                content: new Text(
                  'now is the best time to sleep',
                  style: new TextStyle(fontSize: 18),
                ),
                isActive: _currentStep == 3 ? true : false,
              ),
            ],
          ),
        ),
        new Center(
          child: ListTile(
            leading: new Text(
              _daysCompeleted.toString(),
              style: TextStyle(
                fontSize: 30,
                fontStyle: FontStyle.italic,
              ),
              textAlign: TextAlign.center,
            ),
            title: new Text('${validateMonth(_daysCompeleted)} days to go'),
            subtitle: new Text('this is one month plan'),
            trailing: new Text(
              getMonths(_daysCompeleted).toString(),
              style: TextStyle(
                fontSize: 30,
                fontStyle: FontStyle.italic,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}
