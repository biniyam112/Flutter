import 'package:flutter/material.dart';

class UserPage extends StatefulWidget {
  UserPage({Key key}) : super(key: key);

  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: new BoxDecoration(
        color: Color(0xFF8723A9),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          new Expanded(
            flex: 2,
            child: new Container(
              width: MediaQuery.of(context).size.width,
              height: double.infinity,
              decoration: new BoxDecoration(
                color: Colors.white,
                borderRadius: new BorderRadius.vertical(
                  bottom: Radius.circular(20),
                ),
              ),
              child: new Chip(
                label: new Text(
                  'this is the lable',
                ),
                avatar: new CircleAvatar(
                  child: new Image.asset('landscape.jpg'),
                  radius: 30,
                ),
                deleteIcon: Icon(
                  Icons.delete,
                ),
                onDeleted: () {
                  print('deleted');
                },
                elevation: 3,
                backgroundColor: Colors.brown,
              ),
            ),
          ),
          new Expanded(
            flex: 3,
            child: new Container(
              child: new PopupMenuButton(
                itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                  PopupMenuItem(
                    value: "copy",
                    child: Text("Copy"),
                  ),
                  PopupMenuItem(
                    value: "cut",
                    child: Text("Cut"),
                  ),
                  PopupMenuItem(
                    value: "paste",
                    child: Text("Paste"),
                  ),
                ],
                onSelected: (selectedValue) {
                  print(selectedValue);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
