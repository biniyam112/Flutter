import 'package:flutter/material.dart';

import '../constants.dart';
import 'form_field_container.dart';

class PasswordField extends StatefulWidget {
  PasswordField({Key key}) : super(key: key);

  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  @override
  Widget build(BuildContext context) {
    bool isPasswordVisible = false;
    return FormFieldContainer(
      textFormField: TextFormField(
        decoration: InputDecoration(
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          prefixIcon: Icon(
            Icons.lock,
            color: kPrimaryColor,
          ),
          suffixIcon: InkWell(
            onTap: () {
              setState(() {
                isPasswordVisible = !isPasswordVisible;
              });
            },
            borderRadius: BorderRadius.circular(100),
            child: Icon(
              isPasswordVisible ? Icons.visibility_off : Icons.visibility,
              color: kPrimaryColor,
            ),
          ),
          hintText: 'password',
          hintStyle: TextStyle(
            color: Colors.black54,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
