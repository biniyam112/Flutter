import 'dart:math';
import 'package:flutter/material.dart';
import 'package:password_saver/models/accountModel.dart';
import 'package:password_saver/screens/accountDetailsPage/accountDetails.dart';
import 'package:provider/provider.dart';

class AccountItemsList extends StatefulWidget {
  AccountItemsList({Key key}) : super(key: key);

  @override
  _AccountItemsListState createState() => _AccountItemsListState();
}

class _AccountItemsListState extends State<AccountItemsList> {
  Random _random = new Random();
  List<Color> _accentColors = Colors.accents;

  @override
  Widget build(BuildContext context) {
    final accounts = Provider.of<List<Account>>(context);
    for (var doc in accounts) {
      print(doc.password);
    }

    return ListView.builder(
        itemCount: accounts.length ?? 0,
        itemBuilder: (context, index) {
          return new Padding(
            padding: new EdgeInsets.symmetric(vertical: 2),
            child: new Card(
              elevation: 4,
              color: Color(0xFF333333),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return AccountDetails(account: accounts[index]);
                      },
                    ),
                  );
                },
                child: ListTile(
                  contentPadding: new EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 10,
                  ),
                  leading: Container(
                    width: 60,
                    height: 60,
                    decoration: new BoxDecoration(
                      color:
                          _accentColors[_random.nextInt(_accentColors.length)],
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    child: Center(
                      child: new Text(
                        accounts[index]
                                .accountName
                                .substring(0, 1)
                                .toUpperCase() ??
                            '',
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: new TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontFamily: 'PopinsSB',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  title: new Text(
                    accounts[index].accountName.toUpperCase() ?? '',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: new TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'PopinsR',
                    ),
                  ),
                  subtitle: new Text(
                    accounts[index].email ?? ' ',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: new TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'PopinsR',
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }
}
