import 'package:flutter/services.dart';

String loginExceptionMessage(dynamic exception) {
  if (exception is PlatformException) {
    switch (exception.code) {
      case 'ERROR_INVALID_EMAIL':
        return 'Invalid email format';
      case 'ERROR_WRONG_PASSWORD':
        return 'invalid user name or password';
      default:
        return 'invalid username or password';
    }
  }
  return 'No connection, try again';
}

String signinExceptionMessage(dynamic exception) {
  if (exception is PlatformException) {
    switch (exception.code) {
      case 'ERROR_INVALID_EMAIL':
        return 'Invalid email format';
      case 'ERROR_EMAIL_ALREADY_IN_USE':
        return 'email already in use';
      default:
        return 'sign up failed, try again';
    }
  }
  return 'No connection, try again';
}
