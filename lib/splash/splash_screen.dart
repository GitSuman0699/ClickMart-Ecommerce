import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_project/auth/authentication_service.dart';
import 'package:firebase_project/home/home_screen.dart';
import 'package:firebase_project/login/phone_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  static String routeName = 'splash';
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: AuthenticationService.instance.currentUser,

      // FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          // check is user logged in or not
          if (snapshot.hasData) {
            return const HomeScreen();
            // check if there's any error or not
          } else if (snapshot.hasError) {
            ErrorDescription("Unknown Error From Main Firebase");
          }
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        // new user or logged out user will be redirected to login screen
        return const Login();
        // return const OtpScreen();
      },
    );
  }
}
