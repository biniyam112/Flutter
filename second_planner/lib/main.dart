import 'package:flutter/material.dart';

main() {
  runApp(HomePage());
}

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MainPage();
  }
}

class _MainPage extends State {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: new Text(
            '30 days Planner',
            style: new TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.black87,
        ),
        body: new Container(
          child: new ListView.builder(
            itemBuilder: (context, index) {
              return _planListItem(context, index, 90);
            },
            itemCount: 30,
          ),
        ),
      ),
    );
  }
}

Widget _planListItem(BuildContext context, int day, double progressValue) {
  String _subtitleValidator(int day) {
    if (day >= 30 - (1)) {
      return 'Compeletion date';
    } else if (day == 0) {
      return 'Starting date';
    }
    return '${30 - (day)} days left';
  }

  return new Card(
    child: ListTile(
      title: new Text(
        'Day ${day + 1}',
        style: new TextStyle(
          fontSize: 17,
        ),
      ),
      subtitle: new Text(
        _subtitleValidator(day),
      ),
      trailing: new CircularProgressIndicator(
        value: progressValue,
        strokeWidth: 10,
        semanticsLabel: 'progress',
        semanticsValue: 'this is the lable',
      ),
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return CheckListPage('Day ${day + 1}');
          },
        ),
      ),
    ),
  );
}

class CheckListPage extends StatefulWidget {
  final String title;
  CheckListPage(this.title);
  State<StatefulWidget> createState() {
    return _CheckListPage(title);
  }
}

class _CheckListPage extends State {
  int _currentPage = 1;
  List<bool> studytruthList = _createTruthValue(4);
  List<bool> workouttruthList = _createTruthValue(5);
  List<bool> eatingtruthList = _createTruthValue(6);
  List<String> studytitleList = [
    'One hour mark',
    'two hours in',
    'on the third hour',
    'Four hours completed'
  ];
  List<String> workouttitleList = [
    'Chest',
    'Triceps',
    'Shoulders',
    'Biceps',
    'Abs'
  ];
  List<String> eatingtitleList = [
    '8:00 am',
    '10:30 am',
    '1:30 pm',
    '4:00 pm',
    '8:00 am',
    '12:00 pm'
  ];
  Widget _checkListItems(
      GlobalKey globalKey, int currentPage, int index, BuildContext context) {
            if (currentPage == 0) {
      print(index);
      print(studytitleList[index]);
      print(studytruthList);
      print('=========================');
      return CheckBoxBuilder(
          globalKey, index, studytitleList[index], studytruthList);
    } else if (currentPage == 1) {
      print(index);
      print(workouttitleList[index]);
      print(workouttruthList);
      print('=========================');
      return CheckBoxBuilder(
          globalKey, index, workouttitleList[index], workouttruthList);
    } else if (currentPage == 2) {
      print(index);
      print(eatingtitleList[index]);
      print(eatingtruthList);
      print('=========================');
      return CheckBoxBuilder(
          globalKey, index, eatingtitleList[index], eatingtruthList);
    } else
      return null;
  }

  int _listCount(int currentPage) {
    if (currentPage == 0) {
      return 4;
    } else if (currentPage == 1) {
      return 5;
    } else if (currentPage == 2) {
      return 6;
    } else
      return null;
  }

  String _title(int currentPage) {
    if (currentPage == 0) {
      return 'Study Goal';
    } else if (currentPage == 1) {
      return 'Work-out Goal';
    } else if (currentPage == 2) {
      return 'Eating goal';
    } else
      return null;
  }

  GlobalKey _listBuilderKey = new GlobalKey();

  final String title;
  _CheckListPage(this.title);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: new Text(
          'Plans',
          style: new TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      bottomNavigationBar: new BottomNavigationBar(
        items: [
          new BottomNavigationBarItem(
            icon: Icon(
              Icons.book,
            ),
            title: new Text(
              'Study',
            ),
          ),
          new BottomNavigationBarItem(
            icon: Icon(
              Icons.fitness_center,
            ),
            title: new Text(
              'Work-out',
            ),
          ),
          new BottomNavigationBarItem(
            icon: Icon(
              Icons.fastfood,
            ),
            title: new Text(
              'Eating',
              style: new TextStyle(),
            ),
          ),
        ],
        currentIndex: _currentPage,
        selectedIconTheme: IconThemeData.lerp(
            IconThemeData(
              color: Colors.deepOrange,
              opacity: 10,
            ),
            IconThemeData(
              color: Colors.deepOrange,
              opacity: 100,
            ),
            5),
        unselectedIconTheme: IconThemeData.lerp(
            IconThemeData(
              color: Colors.white60,
              opacity: 60,
            ),
            IconThemeData(
              color: Colors.white60,
              opacity: 80,
            ),
            5),
        unselectedItemColor: Colors.white,
        selectedFontSize: 14,
        selectedItemColor: Colors.white,
        backgroundColor: Colors.black87,
        onTap: (currentPage) {
          setState(
            () {
              _currentPage = currentPage;
            },
          );
        },
      ),
      body: Container(
        child: ListView.builder(
          key: _listBuilderKey,
          itemBuilder: (context, index) {
            return _checkListItems(
                _listBuilderKey, _currentPage, index, context);
          },
          itemCount: _listCount(_currentPage),
        ),
      ),
    );
  }
}

List<bool> _createTruthValue(int checkedNum) {
  List<bool> truthValueList = new List(checkedNum);
  for (int o = 0; o < checkedNum; o++) {
    truthValueList[o] = false;
  }
  return truthValueList;
}

List<bool> _setTruthValue(List<bool> truthList, int index) {
  for (int o = 0; o <= index; o++) {
    truthList[o] = true;
  }
  return truthList;
}

class CheckBoxBuilder extends StatefulWidget {
  final GlobalKey _globalKey;
  final int index;
  final String title;
  final List<bool> checkstatus;
  CheckBoxBuilder(this._globalKey, this.index, this.title, this.checkstatus);
  @override
  State<StatefulWidget> createState() {
    print(index.toString());
    print(title);
    print(checkstatus);
    print('++++++++++++++++++++++++++++');
    return _CheckBoxBuilder(_globalKey, index, title, checkstatus);
  }
}

class _CheckBoxBuilder extends State {
  final GlobalKey _globalKey;
  final int index;
  final String title;
  List<bool> checkstatus;
  _CheckBoxBuilder(this._globalKey, this.index, this.title, this.checkstatus);

  @override
  Widget build(BuildContext context) {
    print(index.toString());
    print(title);
    print(checkstatus);
    return new Padding(
      padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
      child: Card(
        child: ListTile(
          leading: new Checkbox(
            value: checkstatus[index],
            onChanged: (value) {
              setState(
                () {
                  checkstatus = _setTruthValue(checkstatus, index);
                },
              );
              // _globalKey.currentState.setState(() {
              //   checkstatus = _setTruthValue(checkstatus, index);
              //   print(checkstatus);
              // });
            },
          ),
          title: new Text(
            title,
          ),
        ),
      ),
    );
  }
}
