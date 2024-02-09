import 'package:firebase_project/Main/main.dart';
import 'package:firebase_project/utils/common_widgets/app_button.dart';
import 'package:firebase_project/utils/common_widgets/app_text_field.dart';
import 'package:firebase_project/utils/common_widgets/gradient_header.dart';
import 'package:firebase_project/utils/constants/colors.dart';
import 'package:firebase_project/utils/constants/font_styles.dart';
import 'package:firebase_project/utils/device/device_utility.dart';
import 'package:flutter/material.dart';

class SignUp extends StatelessWidget {
  static const String routeName = 'signup';
  const SignUp({super.key});

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
          _buildForm(context),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return AppHeaderGradient(
      fixedHeight: MediaQuery.of(context).size.height * .25,
      isProfile: false,
      text: 'Profile Info',
    );
  }

  Widget _buildForm(BuildContext context) {
    return Form(
        child: Container(
      margin: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              showModalSheet(context);
            },
            child: const CircleAvatar(
              radius: 50.0,
              backgroundColor: AppColors.lightGrey,
            ),
          ),
          const Text('Upload photo'),
          const SizedBox(height: 20.0),
          AppTextField(
            hintText: 'Your name',
            labelText: 'Name',
            onTap: () {},
          ),
          const SizedBox(height: 20.0),
          AppTextField(
            hintText: 'Email address',
            labelText: 'Email',
            onTap: () {},
          ),
          const SizedBox(height: 20.0),
          AppTextField(
            hintText: 'You address',
            labelText: 'Address',
            onTap: () {},
          ),
          const SizedBox(height: 20.0),
          AppButton.button(
              text: 'Save',
              textColor: AppColors.white,
              width: AppDeviceUtils.getScreenWidth(context),
              height: AppDeviceUtils.getScreenHeight(context) * .07,
              color: AppColors.primary,
              onTap: () {
                Navigator.pushReplacementNamed(context, Main.routeName);
              }),
          const SizedBox(height: 10.0),
          TextButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, Main.routeName);
            },
            child: Text(
              'Skip',
              style: FontStyles.montserratBold17().copyWith(color: Colors.grey),
            ),
          ),
        ],
      ),
    ));
  }

  showModalSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 10.0),
                child: ListTile(
                  onTap: () {},
                  leading: const Icon(Icons.settings_rounded),
                  title: const Text('From gallery'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: ListTile(
                  onTap: () {},
                  leading: const Icon(Icons.camera_alt_outlined),
                  title: const Text('From Camera'),
                ),
              )
            ],
          );
        });
  }
}
