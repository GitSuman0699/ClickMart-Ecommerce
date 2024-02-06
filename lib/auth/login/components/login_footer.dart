import 'package:firebase_project/auth/authentication_service.dart';
import 'package:firebase_project/utils/device/device_utility.dart';
import 'package:flutter/material.dart';

class LoginFooter extends StatelessWidget {
  const LoginFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppDeviceUtils.getScreenWidth(context),
      child: ElevatedButton.icon(
        onPressed: () async {
          await AuthenticationService.instance.signInWithGoogle();
        },
        icon: const Icon(Icons.g_mobiledata_rounded),
        label: const Text("SignIn With Google"),
      ),
    );
  }
}
