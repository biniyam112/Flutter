import 'package:flutter/material.dart';

import '../../../constants.dart';

class CategoryTitle extends StatelessWidget {
  const CategoryTitle({
    Key key,
    @required this.title,
    this.isActive = false,
  }) : super(key: key);

  final String title;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12.0, top: 30),
      child: InkWell(
        onTap: () {},
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 26),
          decoration: BoxDecoration(
            color: isActive ? Color(0xFF00C853) : Colors.white,
            border: isActive
                ? null
                : Border.all(
                    color: Colors.black,
                  ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text(
              '${title.substring(0, 1).toUpperCase()}${title.substring(1, title.length).toLowerCase()}',
              style: Theme.of(context).textTheme.button.copyWith(
                    color: isActive ? Colors.white : kTextColor.withOpacity(.8),
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
