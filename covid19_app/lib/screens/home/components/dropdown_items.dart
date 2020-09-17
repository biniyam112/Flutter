import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constant.dart';
import '../../../size_configuration.dart';

class DropDownItems extends StatefulWidget {
  DropDownItems({Key key}) : super(key: key);

  @override
  _DropDownItemsState createState() => _DropDownItemsState();
}

class _DropDownItemsState extends State<DropDownItems> {
  @override
  Widget build(BuildContext context) {
    String selectedCountry = "Ethiopia";
    return Row(
      children: [
        SvgPicture.asset('assets/icons/maps-and-flags.svg'),
        SizedBox(width: getProportionateScreenWidth(20)),
        Expanded(
          child: DropdownButton(
            isExpanded: true,
            underline: SizedBox(),
            icon: SvgPicture.asset('assets/icons/dropdown.svg'),
            iconSize: 20,
            value: selectedCountry,
            items: ['Ethiopia', 'United States', 'Japan', 'Canada']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(
                  value,
                  style: kHeadingTextStyle,
                ),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                selectedCountry = value;
              });
            },
          ),
        ),
      ],
    );
  }
}
