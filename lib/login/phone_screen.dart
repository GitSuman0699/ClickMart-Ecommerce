import 'package:firebase_project/login/verification_screen.dart';
import 'package:firebase_project/login/widgets/international_input_field.dart';
import 'package:firebase_project/utils/common_widgets/app_button.dart';
import 'package:firebase_project/utils/common_widgets/gradient_header.dart';
import 'package:firebase_project/utils/constants/colors.dart';
import 'package:firebase_project/utils/constants/font_styles.dart';
import 'package:firebase_project/utils/device/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Login extends StatelessWidget {
  static String routeName = 'login';
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildHeader(context),
          _buildWidget(context),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return const AppHeaderGradient(
      text: 'What Is Your Phone Number',
      isProfile: false,
    );
  }

  Widget _buildWidget(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 20.0.h),
      child: Column(
        children: [
          Text(
            'Please enter your phone number to verify your account',
            style: FontStyles.montserratRegular17(),
          ),
          _buildPhoneField(context, formKey),
          SizedBox(height: 30.0.h),
          _buildSendButton(context, formKey),
          SizedBox(height: 20.0.h),
          _buildSkipButton()
        ],
      ),
    );
  }

  Widget _buildPhoneField(BuildContext context, GlobalKey<FormState> formKey) {
    return Container(
      margin: EdgeInsets.only(top: 20.0.h),
      height: 64.h,
      width: AppDeviceUtils.getScreenWidth(context),
      child: PhoneInput(formKey: formKey),
    );
  }

  Widget _buildSendButton(BuildContext context, GlobalKey<FormState> formKey) {
    return AppButton.button(
        height: 45.0.h,
        width: double.infinity,
        color: AppColors.primary,
        onTap: () {
          formKey.currentState!.save();
          if (formKey.currentState!.validate()) {
            Navigator.pushNamed(context, Verification.routeName);
          }
        },
        text: 'Send Verification Code',
        textColor: AppColors.white);
  }

  Widget _buildSkipButton() {
    return TextButton(
      onPressed: () {},
      child: Text(
        'Skip',
        style: FontStyles.montserratBold17().copyWith(color: Colors.grey),
      ),
    );
  }
}
