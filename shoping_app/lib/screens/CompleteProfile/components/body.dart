import 'package:flutter/material.dart';
import 'package:shoping_app/components/custom_suffix_icon.dart';
import 'package:shoping_app/components/default_button.dart';
import 'package:shoping_app/components/form_error.dart';
import 'package:shoping_app/constants.dart';
import 'package:shoping_app/screens/Otp/otp_screen.dart';
import 'package:shoping_app/size_config.dart';

class Body extends StatelessWidget {
  const Body({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: getProportionateScreenWidth(20),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: SizeConfig.screenHeight * .03),
              Text(
                'Complete Profile',
                style: headingStyle,
              ),
              Text(
                'Complete you\'r details or continue \n with social media',
                textAlign: TextAlign.center,
              ),
              SizedBox(height: SizeConfig.screenHeight * .05),
              CompleteProfileForm(),
              SizedBox(height: getProportionateScreenHeight(30)),
              Text(
                'By continuing youagree with \n our terms and conditions',
                textAlign: TextAlign.center,
              ),
              SizedBox(height: getProportionateScreenHeight(30)),
            ],
          ),
        ),
      ),
    );
  }
}

class CompleteProfileForm extends StatefulWidget {
  CompleteProfileForm({Key key}) : super(key: key);

  @override
  _CompleteProfileFormState createState() => _CompleteProfileFormState();
}

class _CompleteProfileFormState extends State<CompleteProfileForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> errors = [];
  String firstName, lastName, phoneNumber, address;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildFristNameFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildLastNameFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPhoneNumberFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildAddressFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(30)),
          DefaultButton(
            buttonText: 'Continue',
            onPress: () {
              if (_formKey.currentState.validate()) {
                Navigator.pushNamed(context, OtpScreen.routeName);
              }
            },
          ),
        ],
      ),
    );
  }

  TextFormField buildAddressFormField() {
    return TextFormField(
      onSaved: (newValue) {
        address = newValue;
      },
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(kAddressNullError)) {
          setState(() {
            errors.remove(kAddressNullError);
          });
          return '';
        }
      },
      keyboardType: TextInputType.streetAddress,
      validator: (value) {
        if (value.isEmpty && !errors.contains(kAddressNullError)) {
          setState(() {
            errors.add(kAddressNullError);
          });
          return '';
        } else if ((value.isEmpty && errors.contains(kAddressNullError))) {
          return '';
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: 'Address',
        hintText: 'enter your address',
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon:
            CustomSuffixIcon(imagePath: 'assets/icons/Location point.svg'),
      ),
    );
  }

  TextFormField buildPhoneNumberFormField() {
    return TextFormField(
      onSaved: (newValue) {
        phoneNumber = newValue;
      },
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(kphoneNumberNullError)) {
          setState(() {
            errors.remove(kphoneNumberNullError);
          });
          return '';
        }
      },
      keyboardType: TextInputType.phone,
      validator: (value) {
        if (value.isEmpty && !errors.contains(kphoneNumberNullError)) {
          setState(() {
            errors.add(kphoneNumberNullError);
          });
          return '';
        } else if ((value.isEmpty && errors.contains(kphoneNumberNullError))) {
          return '';
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: 'Phone',
        hintText: 'enter your phone number',
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(imagePath: 'assets/icons/Phone.svg'),
      ),
    );
  }

  TextFormField buildLastNameFormField() {
    return TextFormField(
      onSaved: (newValue) {
        lastName = newValue;
      },
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(klastNameNullError)) {
          setState(() {
            errors.remove(klastNameNullError);
          });
          return '';
        }
      },
      keyboardType: TextInputType.name,
      validator: (value) {
        if (value.isEmpty && !errors.contains(klastNameNullError)) {
          setState(() {
            errors.add(klastNameNullError);
          });
          return '';
        } else if ((value.isEmpty && errors.contains(klastNameNullError))) {
          return '';
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: 'Last name',
        hintText: 'enter your last name',
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(imagePath: 'assets/icons/User.svg'),
      ),
    );
  }

  TextFormField buildFristNameFormField() {
    return TextFormField(
      onSaved: (newValue) {
        firstName = newValue;
      },
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(kFristNameNullError)) {
          setState(() {
            errors.remove(kFristNameNullError);
          });
          return '';
        }
      },
      keyboardType: TextInputType.name,
      validator: (value) {
        if (value.isEmpty && !errors.contains(kFristNameNullError)) {
          setState(() {
            errors.add(kFristNameNullError);
          });
          return '';
        } else if ((value.isEmpty && errors.contains(kFristNameNullError))) {
          return '';
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: 'First name',
        hintText: 'enter your first name',
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(imagePath: 'assets/icons/User.svg'),
      ),
    );
  }
}
