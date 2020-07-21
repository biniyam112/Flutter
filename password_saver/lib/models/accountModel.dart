import 'package:flutter/material.dart';

class Account {
  final String accountName;
  final String email;
  final String password;
  final String modifiedDate;
  final String accountDescription;
  Account(
      {@required this.accountName,
      @required this.email,
      @required this.password,
      @required this.modifiedDate,
      @required this.accountDescription});
}
