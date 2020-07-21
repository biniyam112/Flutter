import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:password_saver/models/accountModel.dart';

class DatabaseHandler {
  final String uid;

  DatabaseHandler({@required this.uid});

  final CollectionReference _accountCollection =
      Firestore.instance.collection('user');

  Future updateUserData(String accountName, String email, String password,
      String date, String accountDescription) async {
    try {
      return await _accountCollection.firestore.collection('user').add(
        {
          'uid': uid,
          'accountName': accountName,
          'email': email,
          'password': password,
          'modifiedDate': date,
          'accountDescription': accountDescription,
        },
      ).timeout(
          Duration(
            seconds: 10,
          ), onTimeout: () {
        throw new Exception('TimeOutException');
      });
    } catch (exception) {
      throw exception;
    }
  }

  //delete userdata by accountname
  Future deleteAccount(Account account)async{
  try{
    return await _accountCollection.firestore.document(uid).delete();
  }catch(exception){
    throw exception;
  }

  }

  Future<List<Account>> get getAccountsById async {
    return await _accountCollection.document(uid).snapshots().where((snapshot) {
      return snapshot.data['uid'] == uid;
    }).map((docSnapshot) {
      return Account(
          accountName: docSnapshot.data['accountName'] ?? null,
          email: docSnapshot.data['email'] ?? null,
          password: docSnapshot.data['password'] ?? null,
          modifiedDate: docSnapshot.data['modifiedDate'] ?? null,
          accountDescription: docSnapshot.data['account'] ?? null);
    }).toList();
  }



  Stream<List<Account>> get accounts {
    return _accountCollection.snapshots().map((_accountListFromSnapshot));
  }

// get all the accounts
  List<Account> _accountListFromSnapshot(QuerySnapshot querySnapshot) {
    return querySnapshot.documents.where((snapshot) {
      return snapshot.data['uid'] == uid;
    }).map((docSnapshot) {
      return Account(
          accountName: docSnapshot.data['accountName'] ?? null,
          email: docSnapshot.data['email'] ?? null,
          password: docSnapshot.data['password'] ?? null,
          modifiedDate: docSnapshot.data['modifiedDate'] ?? null,
          accountDescription: docSnapshot.data['account'] ?? null);
    }).toList();
  }
}
