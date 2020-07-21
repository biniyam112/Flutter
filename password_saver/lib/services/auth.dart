import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:password_saver/models/userModel.dart';

class AuthService extends Equatable {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

// change firebase user to User object
  User authresultToUser(AuthResult authResult) {
    FirebaseUser user = authResult.user;
    return User(
      user.uid,
      usernamefromemail(user.email),
      user.email,
    );
  }

  String usernamefromemail(String email) {
    int index = email.indexOf('@');
    return email.substring(0, index);
  }

  User toUser(FirebaseUser user) {
    if (user != null)
      return User(
        user.uid,
        user.isAnonymous.toString(),
        user.email,
      );
    else
      return null;
  }

// get User Object
  Stream<User> get user {
    return _firebaseAuth.onAuthStateChanged.map((FirebaseUser user) {
      return toUser(user);
    });
  }

  // register new user
  Future<AuthResult> signupWithEmail(String email, String password) async {
    return await _firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password)
        .catchError(
      (exception) {
        throw exception;
      },
      test: (exception) => true,
    ).timeout(
      Duration(seconds: 5),
      onTimeout: () {
        throw Exception(AuthException);
      },
    );
  }

  // sign in with email and passowrd
  Future<dynamic> signInWithEmail(String email, String password) async {
    return await _firebaseAuth
        .signInWithEmailAndPassword(email: email, password: password)
        .catchError(
      (exception) {
        throw exception;
      },
      test: (exception) => true,
    ).timeout(
      Duration(seconds: 5),
      onTimeout: () {
        throw Exception(AuthException);
      },
    );
  }

// sign out user
  Future signOut() async {
    try {
      print('\n\n\nsigned out\n\n\n');
      return await _firebaseAuth.signOut();
    } catch (exception) {
      print('\n\n\nunable to sign out $exception\n\n\n');
      // more code later
      return exception;
    }
  }

  @override
  List<Object> get props => null;
}
