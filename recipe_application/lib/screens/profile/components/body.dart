import 'package:flutter/material.dart';
import 'package:recipe_application/screens/profile/components/profle_menu_item.dart';

import '../../../size_config.dart';
import 'top_profile_stack.dart';

class Body extends StatelessWidget {
  const Body({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;
    List<ProfileMenuItem> profiles = [
      ProfileMenuItem(
        iconPath: 'assets/icons/bookmark_fill.svg',
        title: 'Saved Recipe',
        onPress: () {},
      ),
      ProfileMenuItem(
        iconPath: 'assets/icons/chef_color.svg',
        title: 'Super  Plan',
        onPress: () {},
      ),
      ProfileMenuItem(
        iconPath: 'assets/icons/language.svg',
        title: 'Change Language',
        onPress: () {},
      ),
      ProfileMenuItem(
        iconPath: 'assets/icons/info.svg',
        title: 'More Info',
        onPress: () {},
      ),
    ];

    return SingleChildScrollView(
      child: Column(
        children: [
          TopProfileStack(
            imagePath: 'assets/images/pic.png',
            name: 'Biniyam Dem',
            email: 'biniyamdemissew112@gmail.com',
          ),
          SizedBox(height: defaultSize * 2),
          Column(
            children: List.generate(
              4,
              (index) => ProfileMenuItem(
                iconPath: profiles[index].iconPath,
                onPress: profiles[index].onPress,
                title: profiles[index].title,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
