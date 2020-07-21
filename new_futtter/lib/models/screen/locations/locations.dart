import 'package:flutter/material.dart';
import '../../../main.dart';
import '../../location.dart';

class Locations extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final locations = Location.fetchAll();

    return Scaffold(
      appBar: AppBar(
        title: Text('Location'),
      ),
      body: ListView(
        children: locations
            .map((location) => GestureDetector(
                  child: RaisedButton(
                    onPressed: () => _onLocationTap(context, location.id),
                    child: Text(
                      location.name,
                      style: Theme.of(context).textTheme.button,
                    ),
                    color: Colors.blue,
                  ),
                ))
            .toList(),
        padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
      ),
    );
  }

  _onLocationTap(BuildContext context, int locationID) {
    Navigator.pushNamed(context, LocationDetailRoute,
        arguments: {"id": locationID});
  }
}
