import 'package:daily_exercise_app/constants.dart';
import 'package:daily_exercise_app/screens/details_screen.dart';
import 'package:daily_exercise_app/widgets/bottom_nav_bar.dart';
import 'package:daily_exercise_app/widgets/exercise_item_card.dart';
import 'package:daily_exercise_app/widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: BottomNavBar(),
      body: Stack(
        children: [
          Container(
            height: size.height * .45,
            decoration: BoxDecoration(
              color: Color(0xFFF5CEB8),
              image: DecorationImage(
                alignment: Alignment.centerLeft,
                image: AssetImage('assets/images/undraw_pilates_gpdb.png'),
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      alignment: Alignment.center,
                      height: 52,
                      width: 52,
                      decoration: BoxDecoration(
                        color: Color(0xFFF2BEA1),
                        shape: BoxShape.circle,
                      ),
                      child: SvgPicture.asset('assets/icons/menu.svg'),
                    ),
                  ),
                  Text(
                    'Good morning\n Biniyam',
                    style: Theme.of(context).textTheme.headline4.copyWith(
                          fontWeight: FontWeight.w900,
                        ),
                  ),
                  SearchBar(),
                  Expanded(
                    child: GridView.count(
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      childAspectRatio: 0.85,
                      crossAxisCount: 2,
                      children: [
                        ExerciseItemCard(
                          cardTitle: 'diet',
                          svgPath: 'assets/icons/Hamburger.svg',
                          onPress: () {},
                        ),
                        ExerciseItemCard(
                          cardTitle: 'exercise',
                          svgPath: 'assets/icons/Excrecises.svg',
                          onPress: () {},
                        ),
                        ExerciseItemCard(
                          cardTitle: 'meditation',
                          svgPath: 'assets/icons/Meditation.svg',
                          onPress: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) {
                                return DetailsScreen();
                              }),
                            );
                          },
                        ),
                        ExerciseItemCard(
                          cardTitle: 'yoga',
                          svgPath: 'assets/icons/yoga.svg',
                          onPress: () {},
                        ),
                        ExerciseItemCard(
                          cardTitle: 'diet recomendation',
                          svgPath: 'assets/icons/Hamburger.svg',
                          onPress: () {},
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
    );
  }
}
