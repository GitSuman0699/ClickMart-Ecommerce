import 'package:firebase_auth/firebase_auth.dart';
import 'signup/signup_exceptions/signup_email_password_exceptions.dart';

class AuthenticationService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Sign up with email and password
  Future signUpWithEmailAndPassword(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return null; // Successful sign-up, no error
    } on FirebaseAuthException catch (e) {
      throw SignUpWithEmailAndPasswordExceptions(e.code);
    } catch (e) {
      return e.toString(); // Return an error message
    }
  }

  // Sign in with email and password
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return null; // Successful sign-up, no error
    } on FirebaseAuthException catch (e) {
      throw SignUpWithEmailAndPasswordExceptions(e.code);
    } catch (e) {
      return e.toString(); // Return an error message
    }
  }

  // Sign out
  Future signOut() async {
    await _auth.signOut();
  }

  // Get the current user
  User? getCurrentUser() {
    return _auth.currentUser;
  }
}
