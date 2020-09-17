import 'package:flutter/material.dart';
import 'package:shoping_app/components/custom_suffix_icon.dart';
import 'package:shoping_app/components/default_button.dart';
import 'package:shoping_app/components/form_error.dart';
import 'package:shoping_app/screens/CompleteProfile/complete_profile.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class SignUpForm extends StatefulWidget {
  SignUpForm({Key key}) : super(key: key);

  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  String email, password, confirmPassword;
  final List<String> errors = [];
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildEmailFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPasswordFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildConfirmPasswordFormField(),
          SizedBox(height: getProportionateScreenHeight(20)),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(20)),
          DefaultButton(
            buttonText: 'Continue',
            onPress: () {
              if (_formKey.currentState.validate()) {
                Navigator.pushNamed(context, CompleteProfileScreen.routeName);
              }
            },
          ),
        ],
      ),
    );
  }

  TextFormField buildConfirmPasswordFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) {
        setState(() {
          confirmPassword = newValue;
        });
      },
      onChanged: (value) {
        if (confirmPassword == password && errors.contains(kMatchPassError)) {
          setState(() {
            errors.remove(kMatchPassError);
          });
          return '';
        }
        setState(() {
          confirmPassword = value;
        });
        return null;
      },
      validator: (value) {
        if (confirmPassword != password && !errors.contains(kMatchPassError)) {
          setState(() {
            errors.add(kMatchPassError);
          });
          return '';
        } else if (confirmPassword != password &&
            errors.contains(kMatchPassError)) {
          return '';
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: 'Password',
        hintText: 'confirm password',
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(imagePath: 'assets/icons/Lock.svg'),
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) {
        password = newValue;
      },
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(kPassNullError)) {
          setState(() {
            errors.remove(kPassNullError);
          });
          return '';
        } else if (value.length >= 8 && errors.contains(kShortPassError)) {
          setState(() {
            errors.remove(kShortPassError);
          });
          return '';
        }
        setState(() {
          password = value;
        });

        return null;
      },
      validator: (value) {
        if (value.isEmpty && !errors.contains(kPassNullError)) {
          setState(() {
            errors.add(kPassNullError);
          });
          return '';
        } else if (value.length != 0 &&
            value.length < 8 &&
            !errors.contains(kShortPassError)) {
          setState(() {
            errors.add(kShortPassError);
          });
          return '';
        } else if ((value.isEmpty && errors.contains(kPassNullError)) ||
            (value.length < 8 && errors.contains(kShortPassError))) {
          return '';
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: 'Password',
        hintText: 'enter password',
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(imagePath: 'assets/icons/Lock.svg'),
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      onSaved: (newValue) {
        setState(() {
          email = newValue;
        });
      },
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(kEmailNullError)) {
          setState(() {
            errors.remove(kEmailNullError);
          });
          return '';
        } else if (emailValidatorRegExp.hasMatch(value) &&
            errors.contains(kEmailNullError)) {
          setState(() {
            errors.remove(kInvalidEmailError);
          });
          return '';
        }
        setState(() {
          email = value;
        });

        return null;
      },
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value.isEmpty && !errors.contains(kEmailNullError)) {
          setState(() {
            errors.add(kEmailNullError);
          });
          return '';
        } else if (!emailValidatorRegExp.hasMatch(value) &&
            !errors.contains(kInvalidEmailError)) {
          setState(() {
            errors.add(kInvalidEmailError);
          });
          return '';
        } else if ((value.isEmpty && errors.contains(kEmailNullError)) ||
            (!emailValidatorRegExp.hasMatch(value) &&
                errors.contains(kInvalidEmailError))) {
          return '';
        }

        return null;
      },
      decoration: InputDecoration(
        labelText: 'Email',
        hintText: 'enter email',
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(imagePath: 'assets/icons/Mail.svg'),
      ),
    );
  }
}
