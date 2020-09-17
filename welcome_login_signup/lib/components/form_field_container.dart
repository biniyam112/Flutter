import 'package:flutter/material.dart';

import '../constants.dart';

class FormFieldContainer extends StatelessWidget {
  const FormFieldContainer({
    Key key,
    @required this.textFormField,
  }) : super(key: key);
  final Widget textFormField;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: 60,
      width: size.width - 40,
      decoration: BoxDecoration(
        color: kPrimaryColor.withOpacity(.14),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Center(child: textFormField),
    );
  }
}
