import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class HelpDeskAppFirebaseUser {
  HelpDeskAppFirebaseUser(this.user);
  User user;
  bool get loggedIn => user != null;
}

HelpDeskAppFirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<HelpDeskAppFirebaseUser> helpDeskAppFirebaseUserStream() => FirebaseAuth
    .instance
    .authStateChanges()
    .debounce((user) => user == null && !loggedIn
        ? TimerStream(true, const Duration(seconds: 1))
        : Stream.value(user))
    .map<HelpDeskAppFirebaseUser>(
        (user) => currentUser = HelpDeskAppFirebaseUser(user));
