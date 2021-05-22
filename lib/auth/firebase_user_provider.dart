import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class CatsFirebaseUser {
  CatsFirebaseUser(this.user);
  final User user;
  bool get loggedIn => user != null;
}

CatsFirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<CatsFirebaseUser> catsFirebaseUserStream() => FirebaseAuth.instance
    .authStateChanges()
    .debounce((user) => user == null && !loggedIn
        ? TimerStream(true, const Duration(seconds: 1))
        : Stream.value(user))
    .map<CatsFirebaseUser>((user) => currentUser = CatsFirebaseUser(user));
