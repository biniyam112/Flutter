import 'package:flutter/material.dart';
import 'package:travelers_app/components/app_bar.dart';
import 'package:travelers_app/components/custon_nav_item.dart';
import 'package:travelers_app/screens/events/components/body.dart';

class EventsScreen extends StatelessWidget {
  const EventsScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(title: 'Events'),
      body: Body(),
      bottomNavigationBar: CustomNavItem(),
    );
  }
}
