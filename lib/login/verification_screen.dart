import 'package:firebase_project/SignUp/sign_up.dart';
import 'package:firebase_project/login/phone_screen.dart';
import 'package:firebase_project/utils/common_widgets/app_button.dart';
import 'package:firebase_project/utils/common_widgets/gradient_header.dart';
import 'package:firebase_project/utils/constants/colors.dart';
import 'package:firebase_project/utils/constants/font_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:otp_text_field/otp_text_field.dart';

class Verification extends StatelessWidget {
  const Verification({super.key});
  static const String routeName = 'verification';

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _buildBody(context));
  }

  Widget _buildBody(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(),
          _buildWidget(context),
          SizedBox(height: 30.0.h),
          _buildContinueButton(context),
          SizedBox(height: 30.0.h),
          _buildResendCodeButton(context),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return const AppHeaderGradient(
      text: 'Verification Code',
      isProfile: false,
    );
  }

  Widget _buildWidget(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 20.0.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Please enter code send to',
            style: FontStyles.montserratRegular17(),
          ),
          SizedBox(height: 20.0.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '+919898989898',
                style: FontStyles.montserratBold17(),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacementNamed(context, Login.routeName);
                },
                child: Text(
                  'Change phone number',
                  style: FontStyles.montserratRegular12()
                      .copyWith(decoration: TextDecoration.underline),
                ),
              ),
            ],
          ),
          SizedBox(height: 30.0.h),
          _buildOTPField(context),
        ],
      ),
    );
  }

  Widget _buildOTPField(BuildContext context) {
    return OTPTextField(
      textFieldAlignment: MainAxisAlignment.spaceEvenly,
      otpFieldStyle: OtpFieldStyle(focusBorderColor: Colors.green),
      width: MediaQuery.of(context).size.width,
      keyboardType: TextInputType.number,
      length: 4,
      style: FontStyles.montserratBold25(),
    );
  }

  Widget _buildContinueButton(BuildContext context) {
    return Center(
      child: AppButton.button(
          width: 327.w,
          height: 45.0.h,
          color: AppColors.primary,
          text: 'Continue',
          textColor: AppColors.white,
          onTap: () {
            Navigator.pushReplacementNamed(context, SignUp.routeName);
          }),
    );
  }

  Widget _buildResendCodeButton(BuildContext context) {
    return Center(
      child: TextButton(
          onPressed: () {},
          child: Text(
            'Resend Code',
            style: FontStyles.montserratBold17().copyWith(color: Colors.grey),
          )),
    );
  }
}