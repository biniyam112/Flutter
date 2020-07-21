import 'package:flutter/material.dart';
import 'text_section.dart';
import 'imagebanner.dart';
import '../../../models/location.dart';

class LocationDetail extends StatelessWidget {
  final int _locationID;

  LocationDetail(this._locationID);

  @override
  Widget build(BuildContext context) {
    final location = Location.fetchById(_locationID);

    return Scaffold(
        appBar: AppBar(
          title: Text(
            location.name,
            style: Theme.of(context).textTheme.headline,
          ),
        ),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              ImageBanner(location.imagePath),
            ]..addAll(textSections(location))));
  }

  List<Widget> textSections(Location location) {
    return location.facts
      .map((fact) => TextSection(fact.title, fact.detail))
      .toList();
  }
}
