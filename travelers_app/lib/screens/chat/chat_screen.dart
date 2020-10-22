import 'package:flutter/material.dart';
import 'package:travelers_app/components/app_bar.dart';
import 'package:travelers_app/components/custon_nav_item.dart';

import 'components/body.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: buildAppBar(isTransparent: true, title: 'Chat'),
      body: Body(),
      bottomNavigationBar: CustomNavItem(),
    );
  }
}
