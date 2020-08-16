import 'package:daily_exercise_app/constants.dart';
import 'package:daily_exercise_app/widgets/bottom_nav_bar.dart';
import 'package:daily_exercise_app/widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xFFf0eee9),
      bottomNavigationBar: BottomNavBar(),
      body: Stack(
        children: [
          Container(
            height: size.height * .45,
            decoration: BoxDecoration(
              color: kBlueLightColor,
              image: DecorationImage(
                image: AssetImage(
                  'assets/images/meditation_bg.png',
                ),
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: size.height * 0.05,
                  ),
                  Text(
                    'Meditation',
                    style: Theme.of(context).textTheme.headline4.copyWith(
                          fontWeight: FontWeight.w900,
                        ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '3-10 min exercise',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  SizedBox(
                    width: size.width * .6,
                    child: Text(
                      'Live an easier life by meditating daily',
                    ),
                  ),
                  SizedBox(
                    width: size.width * .6,
                    child: SearchBar(),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Wrap(
                            spacing: 20,
                            children: [
                              SessionCard(
                                sessionValue: 1,
                                isDone: true,
                                onPress: () {},
                              ),
                              SessionCard(sessionValue: 2),
                              SessionCard(sessionValue: 3),
                              SessionCard(sessionValue: 4),
                              SessionCard(sessionValue: 5),
                              SessionCard(sessionValue: 6),
                              SessionCard(sessionValue: 7),
                            ],
                          ),
                          SizedBox(height: 20),
                          Text(
                            'Meditation',
                            style:
                                Theme.of(context).textTheme.headline6.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                          ),
                          Container(
                            padding: EdgeInsets.all(10),
                            margin: EdgeInsets.symmetric(vertical: 20),
                            height: 90,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 23,
                                  spreadRadius: -13,
                                  offset: Offset(0, 17),
                                  color: kShadowColor,
                                ),
                              ],
                            ),
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                    'assets/icons/Meditation_women_small.svg'),
                                SizedBox(width: 20),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Basic 2',
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle2,
                                      ),
                                      Text('data')
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(10),
                                  child:
                                      SvgPicture.asset('assets/icons/Lock.svg'),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SessionCard extends StatelessWidget {
  const SessionCard({
    Key key,
    this.sessionValue,
    this.isDone = false,
    this.onPress,
  }) : super(key: key);
  final int sessionValue;
  final bool isDone;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Padding(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Container(
            width: constraints.maxWidth / 2 - 10,
            decoration: BoxDecoration(
              color: kBackgroundColor,
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 17),
                  color: kShadowColor,
                  spreadRadius: -13,
                  blurRadius: 23,
                ),
              ],
            ),
            child: Material(
              child: InkWell(
                onTap: onPress,
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Row(
                    children: [
                      Container(
                        height: 42,
                        width: 42,
                        decoration: BoxDecoration(
                          color: isDone ? kBlueColor : Colors.white,
                          shape: BoxShape.circle,
                          border: Border.all(color: kBlueColor),
                        ),
                        child: Icon(
                          Icons.play_arrow,
                          color: isDone ? Colors.white : kBlueColor,
                        ),
                      ),
                      SizedBox(width: 10),
                      Text(
                        'Session $sessionValue',
                        style: Theme.of(context).textTheme.subtitle2,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
