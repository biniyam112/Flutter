import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:furniture_store_app/Screens/HomeScreen/components/body.dart';
import 'package:furniture_store_app/constants.dart';
import 'package:furniture_store_app/size_config.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: buildAppBar(),
      body: Body(),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      leading: IconButton(
        icon: SvgPicture.asset(
          'assets/icons/menu.svg',
          height: SizeConfig.defaultSize * 2,
        ),
        onPressed: () {},
      ),
      actions: [
        IconButton(
          icon: SvgPicture.asset(
            'assets/icons/scan.svg',
            height: SizeConfig.defaultSize * 2.4,
          ),
          onPressed: () {},
        ),
        Center(
          child: Text(
            "Scan",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: kTextColor,
              fontSize: 15,
            ),
          ),
        ),
        SizedBox(
          width: SizeConfig.defaultSize,
        ),
      ],
    );
  }
}
