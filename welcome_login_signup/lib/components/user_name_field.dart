import 'package:flutter/material.dart';

import '../constants.dart';
import 'form_field_container.dart';

class UsernameField extends StatelessWidget {
  const UsernameField({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FormFieldContainer(
      textFormField: TextFormField(
        decoration: InputDecoration(
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          prefixIcon: Icon(
            Icons.account_box,
            color: kPrimaryColor,
          ),
          hintText: 'email or phone',
          hintStyle: TextStyle(
            color: Colors.black54,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
