import 'package:firebase_project/auth/signup/signup_screen.dart';
import 'package:firebase_project/utils/theme/theme.dart';
import 'package:flutter/material.dart';

import 'auth/login/login_screen.dart';

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
      home: const LoginScreen(),
    );
  }
}
