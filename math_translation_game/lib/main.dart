import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:english_words/english_words.dart';
import 'dart:math';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Read smart',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Read smart'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool gameStarted = false;
  int highScore = 0;
  int currentScore = 0;
  static int _gametime = 90;
  Duration remainingtime = Duration(seconds: _gametime);
  Matrix4 transformationMatrix = Matrix4.skewY(0.0)
    ..rotateZ(-3.14)
    ..rotateX(0)
    ..rotateY(0);
  List<String> sentenceList = [];
  final TextEditingController answerController = new TextEditingController();
  final GlobalKey<State<TextFormField>> answerFieldKey =
      new GlobalKey<State<TextFormField>>();

  _restore() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    setState(() {
      // if (sharedPreferences.getStringList('sentence') != null)
      //   sentenceList = sharedPreferences.getStringList('sentence');
      if (sharedPreferences.getInt('highScore') != null)
        highScore = sharedPreferences.getInt('highScore');
      if (sharedPreferences.getStringList('currentScore') != null)
        currentScore = sharedPreferences.getInt('currentScore');
    });
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      _restore();
    });
  }

  _generateSentenceList() {
    sentenceList = [];
    int k = 0;
    String sentence;
    Random random = new Random();
    while (k < 100) {
      int i = 0;
      List wordsList = [];
      while (i < 10) {
        var word = all[random.nextInt(all.length - 1)];

        wordsList.add(word);
        i += word.length + 1;
        sentence = wordsList.join(' ');
      }
      if (i > 10) {
        List tempList = sentence.split(' ');
        tempList.removeLast();
        sentence = tempList.join(' ');
      }
      k++;
      sentenceList.add(sentence);
    }
  }

  _startGame() {
    _generateSentenceList();
    gameStarted = true;
    answerController.text = '';
    _startCountDown();
  }

  /// need function that runs on every second to check if the [remainingtime] is 0 and if it's positive**/
  _startCountDown() {
    Timer.periodic(
      Duration(seconds: 1),
      (timer) {
        setState(
          () {
            if (remainingtime.inSeconds < 1) {
              _endGame();
              timer.cancel();
            } else {
              remainingtime -= Duration(seconds: 1);
            }
          },
        );
      },
    );
  }

  _endGame() async {
    String message;
    if (currentScore > highScore) {
      message = 'new high socre';
    } else {
      message = 'you\'re score';
    }
    answerController.text = '';

    gameStarted = false;
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
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
                    '$currentScore',
                    style: new TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  new Text(
                    message,
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
                        onPressed: () {
                          _newGame();
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  _newGame() {
    setState(() {
      currentScore = 0;
      gameStarted = false;
      remainingtime = Duration(seconds: _gametime);
    });
  }

  _highScorePassed() {
    if (currentScore > highScore) {
      highScore = currentScore;
    }
  }

  String _playingSentencePasser() {
    if (gameStarted) {
      return sentenceList[currentScore];
    } else {
      return ('start');
    }
  }

  // String _previousSentencePasser() {
  //   if (currentScore > 1) {
  //     return sentenceList[currentScore - 1];
  //   } else {
  //     return 'start';
  //   }
  // }

  bool _playerAnswerChecker(String answer) {
    if (answer == sentenceList[currentScore]) {
      return true;
    } else {
      return false;
    }
  }

  String _timeCalculator() {
    if (remainingtime.inSeconds % 60 == 0) {
      return '${remainingtime.inMinutes}' + ':' + '00';
    } else if (remainingtime.inSeconds > 60 &&
        remainingtime.inSeconds % 60 != 0) {
      return '${remainingtime.inMinutes}' +
          ':' +
          '${remainingtime.inSeconds - 60}';
    }
    return '${remainingtime.inMinutes}' + ':' + '${remainingtime.inSeconds}';
  }

  _correctAnswer() {
    currentScore++;
    _highScorePassed();
    answerController.text = '';
    transformationMatrix = _transformationMatrix();
    // time += 5 seconds
    remainingtime += Duration(seconds: 5);
  }

  _wrongAnswer() {
    // time-= 5 seconds;
    remainingtime -= Duration(seconds: 5);
  }

  _transformationMatrix() {
    Random random = new Random();
    List transformationList = [
      Matrix4.skewY(0.0)
        ..rotateZ(3.15)
        ..rotateX(3.3)
        ..rotateY(-6.2),
      Matrix4.skewY(0.0)
        ..rotateZ(6.295)
        ..rotateX(3.3)
        ..rotateY(-6.2),
      Matrix4.skewY(0.0)
        ..rotateZ(-3.14)
        ..rotateX(0)
        ..rotateY(0),
      Matrix4.skewY(0.0)
        ..rotateZ(-3.14)
        ..rotateX(3)
        ..rotateY(0),
      Matrix4.skewY(0.0)
        ..rotateZ(3.14)
        ..rotateX(0)
        ..rotateY(3),
      Matrix4.skewY(0.0)
        ..rotateZ(0)
        ..rotateX(3.12)
        ..rotateY(3),
    ];
    return transformationList[random.nextInt(transformationList.length)];
  }

  _animationController() {
    //all the animations will be done here
  }

  _saveState() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    // sharedPreferences.setStringList('sentence', sentenceList);
    sharedPreferences.setInt('currentScore', currentScore);
    sharedPreferences.setInt('highScore', highScore);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: MaterialColor(0xFF2196F3, {900: Color(0xFF0D47A1)}),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            new Column(
              children: <Widget>[
                new Text(
                  _timeCalculator(),
                  style: new TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                new Text(
                  'Time left',
                  style: new TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                new Column(
                  children: <Widget>[
                    new Text(
                      '$currentScore',
                      style: new TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    new Text(
                      'Current Score',
                      style: new TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
                new Column(
                  children: <Widget>[
                    new Text(
                      '$highScore',
                      style: new TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    new Text(
                      'High Score',
                      style: new TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            new Transform(
              alignment: Alignment.center,
              transform: transformationMatrix,
              child: new Container(
                width: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: MaterialColor(0xFF2196F3, {900: Color(0xFF0D47A1)}),
                ),
                child: new Padding(
                  padding: new EdgeInsets.all(20),
                  child: AnimatedDefaultTextStyle(
                    duration: Duration(seconds: 1),
                    child: new Text(
                      _playingSentencePasser(),
                      style: new TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    style: new TextStyle(),
                  ),
                ),
              ),
            ),
            new TextFormField(
              key: answerFieldKey,
              controller: answerController,
              onChanged: (string) {},
              onEditingComplete: () {},
              onFieldSubmitted: (sentence) {
                setState(() {
                  if (currentScore == 0 && sentence == 'start') {
                    _startGame();
                  } else if (gameStarted == true) {
                    if (_playerAnswerChecker(sentence)) {
                      _correctAnswer();
                    } else {
                      _wrongAnswer();
                    }
                  }
                });
                _saveState();
                print('the sentence list is:' + sentenceList.toString());
              },
              maxLength: 30,
              decoration: InputDecoration(
                hintText: 'start',
                contentPadding: new EdgeInsets.all(20),
              ),
              autofocus: true,
              keyboardType: TextInputType.text,
            ),
          ],
        ),
      ),
    );
  }
}
