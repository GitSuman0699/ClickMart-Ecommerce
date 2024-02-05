import 'package:flutter/material.dart';
import 'components/login_form_widget.dart';
import 'components/login_header.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              LoginHeader(),
              LoginFormWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
