import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_store_app/constants.dart';
import 'package:movie_store_app/size_config.dart';
import 'components/body.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key key}) : super(key: key);

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      key: _scaffoldKey,
      drawer: Align(
        alignment: Alignment.bottomLeft,
        child: Container(
          height: SizeConfig.screenHeight - getProportionateScreenHeight(26),
          width: getProportionateScreenWidth(280),
          decoration: BoxDecoration(
            color: Colors.white,
          ),
        ),
      ),
      appBar: buildAppBar(context),
      body: Body(),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
        padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
        icon: SvgPicture.asset(
          'assets/icons/menu.svg',
          height: 26,
          width: 26,
          fit: BoxFit.cover,
        ),
        onPressed: () {
          _scaffoldKey.currentState.isDrawerOpen
              ? Navigator.pop(context)
              : _scaffoldKey.currentState.openDrawer();
        },
      ),
      actions: [
        IconButton(
          padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
          icon: SvgPicture.asset(
            'assets/icons/search.svg',
            height: 26,
          ),
          onPressed: () {},
        ),
      ],
    );
  }
}
