import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo list',
      home: new TodoList(),
      color: Colors.black,
    );
  }
}

class TodoList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new TodoListState();
  }
}

class TodoListState extends State<TodoList> {
  List<String> _todoitems = ['First'];
  List<String> _todotitles = ['this is the first item'];
//  Map<int,int> _priority = new Map<int,int>();

  @override
  void initState() {
    super.initState();
    restore();
  }

  restore() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    setState(
      () {
        if (sharedPreferences.getStringList('titles') != null &&
            sharedPreferences.getStringList('items') != null) {
          _todotitles = sharedPreferences.getStringList('titles');
          _todoitems = sharedPreferences.getStringList('items');
        }
      },
    );
  }

  _addTodoItem(String title, String task, BuildContext context) {
    if (task.length > 0) {
      setState(() {
        _todoitems.add(task);
        _todotitles.add(title);
      });
      _save('titles', _todotitles);
      _save('items', _todoitems);
    }
    Navigator.pop(context);
  }

  _editTodoItem(String title, String task, int index, BuildContext context) {
    if (task.length > 0) {
      setState(() {
        _todoitems[index] = task;
        _todotitles[index] = title;
      });
      _save('titles', _todotitles);
      _save('items', _todoitems);
    }
    Navigator.pop(context);
  }

  Widget _buildTodoList() {
    return new ListView.builder(itemBuilder: (context, index) {
      if (_todoitems == null) {
        _todoitems = new List<String>();
      } else if (index < _todoitems.length) {
        return _buildTodoItem(_todotitles[index], _todoitems[index], index);
      }
      return null;
    });
  }

  Widget _appTheme(String title, String task, {int index}) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text(
          'todo list',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            letterSpacing: 0.5,
            wordSpacing: 1.5,
          ),
        ),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.white,
      body: _bodyProvider(title, task, index: index),
    );
  }

  Widget _bodyProvider(String title, String task, {int index}) {
    //edid when index != null
    if (index != null) {
      return new Center(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(0, 2, 0, 5),
              child: TextFormField(
                autofocus: true,
                style: TextStyle(fontSize: 18),
                decoration: const InputDecoration(
                    icon: const Icon(Icons.title),
                    labelText: 'enter title',
                    labelStyle: TextStyle(fontSize: 16)),
                initialValue: _todoitems[index] == ''
                    ? ''
                    : _todotitles[index].toString(),
                onChanged: (gettitle) => title = gettitle,
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 2, 0, 5),
              child: TextFormField(
                style: TextStyle(fontSize: 18),
                decoration: const InputDecoration(
                    icon: const Icon(Icons.turned_in),
                    labelText: 'enter memo',
                    labelStyle: TextStyle(fontSize: 16)),
                initialValue:
                    _todoitems[index] == '' ? '' : _todoitems[index].toString(),
                onChanged: (gettask) => task = gettask,
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 12, 0, 5),
              child: new RaisedButton(
                onPressed: () => _editTodoItem(title, task, index, context),
                color: Colors.white30,
                child: Text('Save',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    )),
                padding: const EdgeInsets.all(10.0),
              ),
            ),
          ],
        ),
      );
    } else if (index == null) {
      return new Center(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(0, 2, 0, 5),
              child: new TextFormField(
                autofocus: true,
                style: TextStyle(fontSize: 22),
                decoration: const InputDecoration(
                    icon: const Icon(Icons.title),
                    labelText: 'enter title',
                    labelStyle: TextStyle(fontSize: 18)),
                onChanged: (gettitle) => title = gettitle,
                // Navigator.pop(context);
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 2, 0, 5),
              child: new TextFormField(
                style: TextStyle(fontSize: 22),
                decoration: const InputDecoration(
                    icon: const Icon(Icons.turned_in),
                    labelText: 'enter title',
                    labelStyle: TextStyle(fontSize: 18)),
                onChanged: (gettask) => task = gettask,
                // Navigator.pop(context);
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 12, 0, 5),
              child: new RaisedButton(
                onPressed: () => _addTodoItem(title, task, context),
                color: Colors.white30,
                child: Text('Save',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    )),
                padding: const EdgeInsets.all(10.0),
              ),
            ),
          ],
        ),
      );
    }
    return null;
  }

  Widget _buildTodoItem(String title, String todoText, int index) {
    return Card(
      margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
      color: Colors.white,
      child: Row(
        children: <Widget>[
          new Column(
            children: <Widget>[
              // IconButton
              IconButton(
                icon: Icon(
                  Icons.delete_sweep,
                  color: Colors.red,
                ),
                tooltip: 'delete',
                onPressed: () => _removeTodoItem(index),
              ),
              IconButton(
                icon: Icon(
                  Icons.edit,
                  color: Colors.green,
                ),
                tooltip: 'edit',
                onPressed: () => _pushEdittodoScreen(index),
              ),
            ],
          ),
          new Container(
            padding: const EdgeInsets.fromLTRB(10.0, 0, 10.0, 3.0),
            alignment: Alignment.topLeft,
            width: MediaQuery.of(context).size.width * 0.8,
            child: new Column(
              textDirection: TextDirection.ltr,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 5.0),
                  child: Text(
                    title,
                    style: Theme.of(context).textTheme.title,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 5.0),
                  child: Text(
                    todoText,
                    style: Theme.of(context).textTheme.subhead,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text(
          'todo list',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            letterSpacing: 0.5,
            wordSpacing: 1.5,
          ),
        ),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.white38,
      body: _buildTodoList(),
      floatingActionButton: new FloatingActionButton(
        onPressed: _pushAddtodoScreen,
        tooltip: 'Add items',
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        child: new Icon(Icons.add),
      ),
    );
  }

  void _pushEdittodoScreen(int index) {
    String title = _todotitles[index].toString();
    String task = _todoitems[index].toString();
    Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
      return _appTheme(title, task, index: index);
    }));
  }

  void _pushAddtodoScreen() {
    String title = '';
    String task = '';
    Navigator.of(context).push(
      new MaterialPageRoute(builder: (context) {
        return _appTheme(title, task);
      }),
    );
  }

  void _removeTodoItem(int index) {
    setState(() {
      _todoitems.removeAt(index);
      _todotitles.removeAt(index);
    });
  }

  _save(String key, dynamic value) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    if (value is List<String>) {
      sharedPreferences.setStringList(key, value);
    } else {
      sharedPreferences.setString(key, value);
    }
  }
}
