import 'package:firebase_project/auth/authentication_service.dart';
import 'package:firebase_project/auth/login/login_controller.dart';
import 'package:firebase_project/home/home_screen.dart';
import 'package:firebase_project/utils/device/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OtpScreen extends ConsumerStatefulWidget {
  const OtpScreen({
    super.key,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _OtpScreenState();
}

class _OtpScreenState extends ConsumerState<OtpScreen> {
  final _formKey = GlobalKey<FormState>();

  final otp = TextEditingController(text: "654321");

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: AppDeviceUtils.getScreenWidth(context) - 350),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    TextFormField(
                      style: const TextStyle(color: Colors.black),
                      controller: otp,
                      decoration: const InputDecoration(
                        label: Text(
                          "OTP",
                          style: TextStyle(color: Colors.black),
                        ),
                        prefixIcon: Icon(Icons.person_outline_rounded),
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: AppDeviceUtils.getScreenWidth(context),
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            AuthenticationService.instance
                                .verifyOTP(
                                    verificationId:
                                        ref.read(verificationIdProvider),
                                    otp: otp.text.trim())
                                .then((value) {
                              value
                                  ? Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            const HomeScreen(),
                                      ),
                                    )
                                  : null;
                            });
                          } else {}
                        },
                        child: const Text("Next"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

final numProvider = StateProvider.autoDispose((ref) {
  return num;
});
