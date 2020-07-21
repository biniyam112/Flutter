import 'package:flutter/material.dart';

bool loginFieldFilled(bool usernameFilled, bool passwordFilled) {
  if (usernameFilled && passwordFilled) {
    return true;
  } else
    return false;
}

bool usernameValidator(String username) {
  if (username.isEmpty ||
      (!username.contains(new RegExp(r'[a-z]')) &&
          !username.contains(new RegExp(r'[A-Z]'))) ||
      username.startsWith(' ')) {
    return false;
  } else
    return true;
}

class PasswordState {
  String message;
  MaterialColor color;
  bool hasvalue;
  PasswordState({this.message, this.color, this.hasvalue});
}

PasswordState passwordValidator(String password) {
  final novalue = PasswordState(
    color: Colors.red,
    message: 'weak password',
    hasvalue: false,
  );
  final weakPassword = PasswordState(
    color: Colors.red,
    message: null,
    hasvalue: false,
  );
  final fairPassword = PasswordState(
    color: Colors.green,
    message: 'fair password',
    hasvalue: true,
  );

  if (password.isEmpty) {
    return novalue;
  } else if (password.length < 8) {
    return weakPassword;
  } else
    return fairPassword;
}
