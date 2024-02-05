import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_project/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'auth/login/login_screen.dart';
import 'home/home_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      themeMode: ThemeMode.system,
      theme: AAppTheme.lightTheme,
      darkTheme: AAppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
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
          return const LoginScreen();
        },
      ),
    );
  }
}
