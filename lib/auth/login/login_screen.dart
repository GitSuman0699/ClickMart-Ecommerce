import 'package:firebase_project/utils/common_widgets/app_button.dart';
import 'package:firebase_project/utils/common_widgets/gradient_header.dart';
import 'package:firebase_project/utils/constants/colors.dart';
import 'package:firebase_project/utils/constants/font_styles.dart';
import 'package:firebase_project/utils/device/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'components/login_footer.dart';
import 'components/login_form_widget.dart';
import 'components/login_header.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _buildBody(context, formKey),

      // SingleChildScrollView(
      //   child: Column(
      //     children: <Widget>[
      //       _buildHeader(),
      //       Text(
      //         'Please enter your email and password to verify your account',
      //         style: FontStyles.montserratRegular17(),
      //       ),
      //       const LoginFormWidget(),
      //     ],
      //   ),
      // ),
    );
  }

  Widget _buildBody(BuildContext context, GlobalKey<FormBuilderState> formKey) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildHeader(),
          _buildWidget(context, formKey),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return const AppHeaderGradient(
      text: 'Login with email and password',
      isProfile: false,
    );
  }

  Widget _buildWidget(
      BuildContext context, GlobalKey<FormBuilderState> formKey) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 20.0.h),
      child: Column(
        children: [
          Text(
            'Please enter your email and password to verify your account',
            style: FontStyles.montserratRegular17(),
          ),
          SizedBox(height: 30.0.h),
          _buildFormWidget(context, formKey),
          // SizedBox(height: 5.0.h),
          _buildForgotPassword(),
          // SizedBox(height: 5.0.h),

          // SizedBox(height: 30.0.h),
          _buildLoginButton(context, formKey),
          SizedBox(height: 10.0.h),
          _buildOrWidget(),
          SizedBox(height: 10.0.h),
          _buildLoginFooter()
        ],
      ),
    );
  }

  Widget _buildFormWidget(
      BuildContext context, GlobalKey<FormBuilderState> formKey) {
    return LoginFormWidget(formKey: formKey);
  }

  Widget _buildForgotPassword() {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {},
        child: Text(
          "Forgot Password?",
          style: FontStyles.montserratBold12(),
        ),
      ),
    );
  }

  Widget _buildLoginButton(
      BuildContext context, GlobalKey<FormBuilderState> formKey) {
    return AppButton.button(
        width: double.infinity,
        color: AppColors.primary,
        onTap: () {
          if (formKey.currentState!.saveAndValidate()) {}
        },
        text: 'Login',
        textColor: AppColors.white);
  }

  Widget _buildOrWidget() {
    return Text(
      'OR',
      style: FontStyles.montserratBold14().copyWith(color: AppColors.primary),
    );
  }

  Widget _buildLoginFooter() {
    return const LoginFooter();
  }
}
