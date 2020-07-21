import 'package:flutter/material.dart';
import 'package:new_futtter/models/screen/home/locationDetail.dart';
import './models/screen/locations/locations.dart';
import 'style.dart';

const LocationRoute = '/';
const LocationDetailRoute = '/location_detail';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: _routes(),
      theme: _themeData(),
      // home: MyHomePage(title: 'The home page'),
    );
  }

  _themeData() {
    return ThemeData(
      appBarTheme: AppBarTheme(
        textTheme: TextTheme(title: AppBarTextStyle),
      ),
      textTheme: TextTheme(
        title: TitleTextStle,
        body1: Body1TextStyle,
        headline: AppBarTextStyle,
      ),
    );
  }

  RouteFactory _routes() {
    return (settings) {
      final Map<String, dynamic> arguments = settings.arguments;
      Widget screen;
      switch (settings.name) {
        case LocationRoute:
          screen = Locations();
          break;
        case LocationDetailRoute:
          screen = LocationDetail(arguments['id']);
          break;
        default:
          return null;
      }
      return MaterialPageRoute(builder: (BuildContext context) => screen);
    };
  }
}
