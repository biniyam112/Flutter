import 'package:flutter/widgets.dart';
import 'package:shoping_app/screens/CompleteProfile/complete_profile.dart';
import 'package:shoping_app/screens/Otp/otp_screen.dart';
import 'package:shoping_app/screens/Signup/signup_screen.dart';
import 'package:shoping_app/screens/cart/cart_screen.dart';
import 'package:shoping_app/screens/details/details_screen.dart';
import 'package:shoping_app/screens/home/home_screen.dart';
import 'package:shoping_app/screens/splash/splash_screen.dart';

import 'screens/ForgotPassword/forgot_password_screen.dart';
import 'screens/LoginSuccessful/login_success_screen.dart';
import 'screens/signin/sign_in_screen.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) {
    return SplashScreen();
  },
  SigninScreen.routeName: (context) {
    return SigninScreen();
  },
  ForgotPasswordScreen.routeName: (context) {
    return ForgotPasswordScreen();
  },
  LoginSuccesfulScreen.routeName: (context) {
    return LoginSuccesfulScreen();
  },
  HomeScreen.routeName: (context) {
    return HomeScreen();
  },
  SignupScreen.routeName: (context) {
    return SignupScreen();
  },
  CompleteProfileScreen.routeName: (context) {
    return CompleteProfileScreen();
  },
  OtpScreen.routeName: (context) {
    return OtpScreen();
  },
  DetailsScreen.routeName: (context) {
    return DetailsScreen();
  },
  CartScreen.routeName: (context) {
    return CartScreen();
  },
};
