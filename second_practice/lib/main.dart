import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:second_practice/contact.dart';
import 'package:second_practice/database.dart';
import 'package:call_number/call_number.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(title: 'Phone book'),
    );
  }
}

// methods
String _toPhoneNumber(String inputNumber) {
  List<String> inputNumberList = inputNumber.split('');
  List<String> phoneNumberList = new List();

  for (int i = 0; i < inputNumber.length; i++) {
    if (i % 3 == 0) {
      if (i == 0) {
        phoneNumberList.add(inputNumberList[i]);
      } else {
        phoneNumberList.add('-');
        phoneNumberList.add(inputNumberList[i]);
      }
    } else
      phoneNumberList.add(inputNumberList[i]);
  }
  return phoneNumberList.join();
}

String _toInputNumber(String inputNumber) {
  List<String> phoneNumberList = inputNumber.split('');
  return phoneNumberList.join('-');
}

void _makeCall(String phoneNumber) {
  CallNumber callNumber = new CallNumber();
  callNumber.callNumber(phoneNumber);
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _currentPage = 0;
  Widget _pages(int index) {
    if (index == 0) {
      return Dialer();
    } else if (index == 1) {
      return Contacts();
    } else if (index == 2) {
      return PackageService();
    } else
      return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: MaterialAccentColor(
          32,
          {
            400: Color(0xFF36FF03),
          },
        ),
      ),
      body: _pages(_currentPage),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.dialpad),
            title: new Text('dial up'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contacts),
            title: new Text('contacts'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_shopping_cart),
            title: new Text('Package Service'),
          ),
        ],
        currentIndex: _currentPage,
        backgroundColor: MaterialAccentColor(
          32,
          {
            400: Color(0xFF36FF03),
          },
        ),
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.deepOrange,
        onTap: (int index) {
          setState(() => _currentPage = index);
        },
      ),
    );
  }
}

class Dialer extends StatelessWidget {
  @override
  build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Card(
            child: GestureDetector(
              child: ListTile(
                leading: Icon(
                  Icons.add_circle,
                  color: Colors.blue,
                ),
                trailing: Text(
                  'add to contact',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            AddContact(int.parse(_DialerPad.inputNumber))));
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: DialerPad(),
          ),
        ],
      ),
    );
  }
}

class DialerPad extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DialerPad();
  }
}

class _DialerPad extends State {
  static String inputNumber = '';
  List<String> inputNumberList = new List();
  final TextEditingController textEditingController =
      new TextEditingController();
  void _textFieldDisplay(String number) {
    if (number == '') {
      // remove all
      inputNumberList.clear();
      inputNumber = '';
    } else if (number == '_') {
      // remove last input
      inputNumberList.removeLast();
      inputNumber = inputNumberList.join();
    } else {
      inputNumberList.add(number);
      inputNumber = inputNumberList.join();
    }
    textEditingController.text = _toPhoneNumber(inputNumber);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          new TextField(
            controller: textEditingController,
            enabled: false,
            focusNode: FocusNode(
              canRequestFocus: true,
            ),
            enableInteractiveSelection: true,
            style: new TextStyle(
              color: Colors.black,
              fontSize: 36,
              fontWeight: FontWeight.w300,
              letterSpacing: 1,
            ),
            textAlign: TextAlign.center,
            showCursor: true,
            textAlignVertical: TextAlignVertical.center,
          ),
          new Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              new FlatButton(
                onPressed: () => setState(
                  () {
                    _textFieldDisplay('1');
                  },
                ),
                child: new Text(
                  '1',
                  style: new TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                shape: CircleBorder(),
                splashColor: Colors.green,
              ),
              new FlatButton(
                onPressed: () => setState(
                  () {
                    _textFieldDisplay('2');
                  },
                ),
                child: new Text(
                  '2',
                  style: new TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                shape: CircleBorder(),
                splashColor: Colors.green,
              ),
              new FlatButton(
                onPressed: () => setState(
                  () {
                    _textFieldDisplay('3');
                  },
                ),
                child: new Text(
                  '3',
                  style: new TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                shape: CircleBorder(),
                splashColor: Colors.green,
              ),
            ],
          ),
          new Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new FlatButton(
                onPressed: () => setState(
                  () {
                    _textFieldDisplay('4');
                  },
                ),
                child: new Text(
                  '4',
                  style: new TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                shape: CircleBorder(),
                splashColor: Colors.green,
              ),
              new FlatButton(
                onPressed: () => setState(
                  () {
                    _textFieldDisplay('5');
                  },
                ),
                child: new Text(
                  '5',
                  style: new TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                shape: CircleBorder(),
                splashColor: Colors.green,
              ),
              new FlatButton(
                onPressed: () => setState(
                  () {
                    _textFieldDisplay('6');
                  },
                ),
                child: new Text(
                  '6',
                  style: new TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                shape: CircleBorder(),
                splashColor: Colors.green,
              ),
            ],
          ),
          new Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new FlatButton(
                onPressed: () => setState(
                  () {
                    _textFieldDisplay('7');
                  },
                ),
                child: new Text(
                  '7',
                  style: new TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                shape: CircleBorder(),
                splashColor: Colors.green,
              ),
              new FlatButton(
                onPressed: () => setState(
                  () {
                    _textFieldDisplay('8');
                  },
                ),
                child: new Text(
                  '8',
                  style: new TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                shape: CircleBorder(),
                splashColor: Colors.green,
              ),
              new FlatButton(
                onPressed: () => setState(
                  () {
                    _textFieldDisplay('9');
                  },
                ),
                child: new Text(
                  '9',
                  style: new TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                shape: CircleBorder(),
                splashColor: Colors.green,
              ),
            ],
          ),
          new Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new FlatButton(
                onPressed: () => setState(
                  () {
                    _textFieldDisplay('*');
                  },
                ),
                child: new Text(
                  '*',
                  style: new TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                shape: CircleBorder(),
                splashColor: Colors.green,
              ),
              new FlatButton(
                onPressed: () => setState(
                  () {
                    _textFieldDisplay('0');
                  },
                ),
                child: new Text(
                  '0',
                  style: new TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                shape: CircleBorder(),
                splashColor: Colors.green,
              ),
              new FlatButton(
                onPressed: () => setState(
                  () {
                    _textFieldDisplay('#');
                  },
                ),
                child: new Text(
                  '#',
                  style: new TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                shape: CircleBorder(),
                splashColor: Colors.green,
              ),
            ],
          ),
          new Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Ink(
                decoration: const ShapeDecoration(
                  color: Colors.deepPurple,
                  shape: CircleBorder(),
                ),
                width: 60,
                height: 60,
                child: IconButton(
                  icon: Icon(
                    Icons.clear,
                    color: Colors.white,
                  ),
                  onPressed: () => setState(
                    () {
                      _textFieldDisplay('');
                    },
                  ),
                ),
              ),
              new Ink(
                decoration: const ShapeDecoration(
                  color: Colors.green,
                  shape: CircleBorder(),
                ),
                width: 60,
                height: 60,
                child: new IconButton(
                  icon: Icon(
                    Icons.call,
                    color: Colors.white,
                  ),
                  onPressed: () => setState(
                    () {
                      _makeCall(inputNumber);
                    },
                  ),
                  disabledColor: Colors.green,
                ),
              ),
              new Ink(
                decoration: const ShapeDecoration(
                  color: Colors.red,
                  shape: CircleBorder(),
                ),
                width: 60,
                height: 60,
                child: new IconButton(
                  icon: Icon(
                    Icons.backspace,
                    color: Colors.white,
                  ),
                  onPressed: () => setState(
                    () {
                      _textFieldDisplay('_');
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Contacts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: new ListView.builder(
        itemBuilder: (context, index) {
          List<Contact> contact = _fetchContactsFromDb();
          return _contactItem(contact[index].firstName, contact[index].lastName,
              contact[index].phoneNumber);
        },
        itemCount: _fetchContactsFromDb().length,
      ),
    );
  }

  List<Contact> _fetchContactsFromDb() {
    SqlProvider sqlProvider = new SqlProvider();
    var contactsMapList = sqlProvider.getContacts();
    var contactList = new List<Contact>();
    contactsMapList.then((onValue) {
      onValue.forEach((f) {
        contactList.add(Contact.toContact(f));
      });
    });
    return contactList;
  }

  Widget _contactItem(String firstName, String lastName, int phoneNumber) {
    return ListTile(
      title: new Text('$firstName $lastName'),
      subtitle: new Text(
        '$phoneNumber',
        style: new TextStyle(
          fontSize: 16,
        ),
      ),
    );
  }
}

class PackageService extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: new Column(
        children: <Widget>[
          new Text(
            'internet',
          ),
          new TextFormField(
            keyboardType: TextInputType.number,
          ),
          FlatButton(
            child: new Text('get package'),
            onPressed: (){
              _makeCall('*999*1*2*2*1*1*0937930606*1#');
            },
          ),
        ],
      ),
    );
  }
}

class AddContact extends StatefulWidget {
  final int phoneNumber;
  AddContact(this.phoneNumber);
  @override
  State<StatefulWidget> createState() {
    return _AddContact(phoneNumber);
  }
}

class _AddContact extends State {
  String firstName;
  String lastName;
  String email;
  int phoneNumber;
  Contact contact;

  _AddContact(this.phoneNumber);
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  SqlProvider sqlProvider = new SqlProvider();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MaterialAccentColor(
          32,
          {
            300: Color(0xFF36FF03),
          },
        ),
        actions: <Widget>[
          new FlatButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: new Text(
              'Cancel',
              style: new TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          new FlatButton(
            onPressed: () {
              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();
                sqlProvider.insertContact(contact);
                Navigator.pop(context);
              }
            },
            child: new Text(
              'Save',
              style: new TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: Container(
        child: Padding(
          padding: EdgeInsets.fromLTRB(20, 40, 20, 0),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  keyboardType: TextInputType.text,
                  autofocus: true,
                  enableSuggestions: true,
                  maxLines: 1,
                  validator: (firstName) {
                    if (firstName.length == 0) return 'enter Firstname here';
                    return null;
                  },
                  onSaved: (firstName) {
                    this.contact.firstName = firstName;
                  },
                  decoration: InputDecoration(
                    hintText: 'Benjamin',
                    labelText: 'First name',
                  ),
                ),
                TextFormField(
                  keyboardType: TextInputType.text,
                  autofocus: true,
                  enableSuggestions: true,
                  maxLines: 1,
                  validator: (lastName) {
                    if (lastName.length == 0) return 'enter lastname here';
                    return null;
                  },
                  onSaved: (lastName) {
                    this.contact.lastName = lastName;
                  },
                  decoration: InputDecoration(
                    hintText: 'Franklin',
                    labelText: 'Last name',
                  ),
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  autofocus: true,
                  enableSuggestions: true,
                  maxLines: 1,
                  validator: (phoneNumber) {
                    if (phoneNumber.length == 0)
                      return 'enter Phone number here';
                    return null;
                  },
                  onSaved: (phoneNumber) {
                    this.contact.phoneNumber = int.parse(phoneNumber);
                  },
                  decoration: InputDecoration(
                    hintText: '123-456-789',
                    labelText: 'Phone number',
                  ),
                ),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  autofocus: true,
                  enableSuggestions: true,
                  maxLines: 1,
                  validator: (email) {
                    if (email.length == 0) return 'enter email here';
                    return null;
                  },
                  onSaved: (email) {
                    this.contact.email = email;
                  },
                  decoration: InputDecoration(
                    hintText: 'emailaddress@host.domain',
                    labelText: 'email',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
