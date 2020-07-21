import 'dart:math';
import 'package:flutter/material.dart';
import 'package:password_saver/models/accountModel.dart';
import 'package:password_saver/screens/accountDetailsPage/accountDetails.dart';
import 'package:provider/provider.dart';

class AccountItemsTile extends StatefulWidget {
  AccountItemsTile({Key key}) : super(key: key);

  @override
  _AccountItemsTileState createState() => _AccountItemsTileState();
}

class _AccountItemsTileState extends State<AccountItemsTile> {
  @override
  Widget build(BuildContext context) {
    final accounts = Provider.of<List<Account>>(context);
    for (var doc in accounts) {
      print(doc.password);
    }

    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 4,
      padding: new EdgeInsets.all(4),
      children: accounts.map((account) => listTiles(account, context)).toList(),
    );
  }

  Widget listTiles(Account account, BuildContext context) {
    Random _random = new Random();
    List<Color> _accentColors = Colors.accents;
    return new Padding(
      padding: new EdgeInsets.symmetric(vertical: 4),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return AccountDetails(account: account);
              },
            ),
          );
        },
        child: new Card(
          elevation: 4,
          color: Color(0xFF333333),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Padding(
                padding: new EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 10,
                ),
                child: Container(
                  width: double.infinity,
                  decoration: new BoxDecoration(
                    color: _accentColors[_random.nextInt(_accentColors.length)],
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: new Text(
                    account.accountName.substring(0, 1).toUpperCase() ?? '',
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    style: new TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontFamily: 'PopinsSB',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: new EdgeInsets.symmetric(
                  vertical: 6,
                  horizontal: 12,
                ),
                child: new Text(
                  account.accountName.toUpperCase() ?? '',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  textAlign: TextAlign.left,
                  style: new TextStyle(
                    letterSpacing: 1.2,
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'PopinsR',
                  ),
                ),
              ),
              Padding(
                padding: new EdgeInsets.symmetric(
                  vertical: 6,
                  horizontal: 12,
                ),
                child: new Text(
                  account.email ?? ' ',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: new TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'PopinsR',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ListView.builder(
//     itemCount: accounts.length ?? 0,
//     itemBuilder: (context, index) {
// return new Padding(
//   padding: new EdgeInsets.symmetric(vertical: 4),
//   child: new Card(
//     elevation: 4,
//     color: Colors.white,
//     shape: RoundedRectangleBorder(
//       borderRadius: BorderRadius.circular(10),
//     ),
//     child: GestureDetector(
//       onTap: () {
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) {
//               return AccountDetails(account: accounts[index]);
//             },
//           ),
//         );
//       },
//       child: ListTile(
//         leading: CircleAvatar(
//           radius: 30,
//           backgroundColor: _accentColors[
//               _random.nextInt(_accentColors.length)],
//           child: new Text(
//             accounts[index]
//                     .accountName
//                     .substring(0, 1)
//                     .toUpperCase() ??
//                 '',
//             style: new TextStyle(
//               color: Colors.white,
//               fontSize: 32,
//               fontFamily: 'PopinsSB',
//               fontWeight: FontWeight.w600,
//             ),
//           ),
//         ),
//         title: new Text(
//           accounts[index].accountName ?? '',
//           style: new TextStyle(
//             color: Colors.white,
//             fontSize: 16,
//             fontWeight: FontWeight.w400,
//             fontFamily: 'Sans',
//           ),
//         ),
//         subtitle: new Text(
//           accounts[index].email ?? ' ',
//           style: new TextStyle(
//             color: Colors.white,
//             fontSize: 16,
//             fontWeight: FontWeight.bold,
//             fontFamily: 'Sans',
//           ),
//         ),
//       ),
//     ),
//   ),
// );
// }),
// );
