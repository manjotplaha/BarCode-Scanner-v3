import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService with ChangeNotifier {
  //constructor to check if the user is already logged in or not,

  AuthService() {
    FirebaseAuth.instance.userChanges().listen((User user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
        return user;
      }
    });
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future getCurrentUID() async {
    try {
      var currentUid = (_auth.currentUser).uid;
      return currentUid;
    } catch (e) {
      print('Error getting UID');
      print(e.toString());
      return null;
    }
  }

  Future getCurrentUser() async {
    try {
      // print(_auth.currentUser);
      var currentUser = _auth.currentUser;
      return currentUser;
    } catch (e) {
      print('Error getting CurrentUser');
      // print(e.toString());
      return null;
    }
  }

  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      var user = result.user;
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future signInWithEmailandPass(
      {@required String email, @required String password}) async {
    try {
      // ignore: unused_local_variable
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      print('this is usercredentials: $userCredential'); //not working!!!
      print('User Signed in with Email and Pwd');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

//register  with email and pass
  Future registerWithEmailandPass(
      {@required String email, @required String password}) async {
    try {
      // ignore: unused_local_variable
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    // Create a new credential
    final GoogleAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
