import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FireBase {
  FirebaseAuth auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  //sign in auth with email and password
  Future<String> signInAuth(String email, String password) async {
    String result = 'An unexpected error just occurred';
    if (email.toString().isNotEmpty ||
        password.toString().isNotEmpty ||
        (email.toString().isNotEmpty && password.toString().isNotEmpty)) {
      try {
        await auth.signInWithEmailAndPassword(email: email, password: password);
        result = 'Success';
      } catch (e) {
        result = e.toString();
      }
    } else {
      result = 'Please fill in the text fields';
    }
    return result;
  }

//sign up auth with email and password
  Future<String> signupAuth(String email, String password) async {
    String result = 'An unexpected error just occurred';
    if (email.isNotEmpty ||
        password.isNotEmpty ||
        (email.isNotEmpty && password.isNotEmpty)) {
      try {
        await auth.createUserWithEmailAndPassword(
            email: email, password: password);
        result = 'Success';
      } catch (e) {
        result = e.toString();
      }
    } else {
      result = 'Please fill in the text fields';
    }
    return result;
  }

  // sign in auth with google link
  Future<String> googleSignIn() async {
    String result = 'An unexpected error occurred';
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleSignInAccount!.authentication;
      GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      result = 'Success';
    } catch (e) {
      result = e.toString();
    }
    return result;
  }

//sign out
  signOut() async {
    auth.signOut();
    //fop google sign out
    await _googleSignIn.signOut();
  }

//forgot password
  Future<String> forgotPassword(String email) async {
    String result = 'An unexpected error occurred';
    if (email.toString().isNotEmpty) {
      try {
        await auth.sendPasswordResetEmail(email: email);
        result = 'Success';
      } catch (e) {
        result = e.toString();
      }
    } else {
      result = 'Please fill in the email field';
    }
    return result;
  }
}
