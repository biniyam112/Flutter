import 'package:flutter/material.dart';
import 'package:password_saver/models/userModel.dart';
import 'package:password_saver/screens/homePage/home_page.dart';
import 'package:password_saver/screens/loginPage/loginPage.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('\n\n\nin wrapper');
    final user = Provider.of<User>(context);
    if (user == null) {
      print('to loginPage');
      return LoginPage();
    } else {
      print('to home page');
      return HomePage(
        user: user,
      );
    }
  }
}
