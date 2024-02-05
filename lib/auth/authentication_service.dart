import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_project/utils/exceptions/firebase_auth_exceptions.dart';

class AuthenticationService {
  static AuthenticationService get instance => AuthenticationService();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Sign up with email and password
  Future<UserCredential> signUpWithEmailAndPassword(
      String email, String password) async {
    try {
      final response = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return response; // Successful sign-up, no error
    } on FirebaseAuthException catch (e) {
      throw AppFirebaseAuthException(e.code);
    } catch (e) {
      throw e.toString(); // Return an error message
    }
  }

  // Sign in with email and password
  Future<UserCredential> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      final response = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return response; // Successful sign-up, no error
    } on FirebaseAuthException catch (e) {
      throw AppFirebaseAuthException(e.code);
    } catch (e) {
      throw e.toString(); // Return an error message
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
