import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class BonappFirebaseUser {
  BonappFirebaseUser(this.user);
  final User user;
  bool get loggedIn => user != null;
}

BonappFirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<BonappFirebaseUser> bonappFirebaseUserStream() => FirebaseAuth.instance
    .authStateChanges()
    .debounce((user) => user == null && !loggedIn
        ? TimerStream(true, const Duration(seconds: 1))
        : Stream.value(user))
    .map<BonappFirebaseUser>((user) => currentUser = BonappFirebaseUser(user));
