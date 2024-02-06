import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_project/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'login/login_controller.dart';

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

  Future<void> phoneAuthentication(
      {required String phoneNumber, required WidgetRef ref}) async {
    try {
      await _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await _auth.signInWithCredential(credential);
        },
        verificationFailed: (FirebaseAuthException e) {
          AppFirebaseAuthException(e.code);
        },
        codeSent: (String verificationId, int? resendToken) {
          ref
              .read(verificationIdProvider.notifier)
              .update((state) => verificationId);
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          null;
        },
      );
    } on FirebaseAuthException catch (e) {
      throw AppFirebaseAuthException(e.code);
    } catch (e) {
      throw e.toString(); // Return an error message
    }
  }

  Future<bool> verifyOTP(
      {required String verificationId, required String otp}) async {
    final response =
        await _auth.signInWithCredential(PhoneAuthProvider.credential(
      verificationId: verificationId,
      smsCode: otp,
    ));
    return response.user != null ? true : false;
  }

  Future<UserCredential> signInWithGoogle() async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
      return await FirebaseAuth.instance.signInWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      throw AppFirebaseAuthException(e.code);
    } catch (e) {
      throw e.toString(); // Return an error message
    }
  }

  // Sign out
  Future signOut() async {
    await GoogleSignIn().signOut();
    await _auth.signOut();
    User? firebaseUser;
    print(firebaseUser);
  }

  // Get the current user
  User? getCurrentUser() {
    return _auth.currentUser;
  }
}
