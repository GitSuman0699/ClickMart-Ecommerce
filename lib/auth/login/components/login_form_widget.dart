import 'package:firebase_project/auth/otp/otp_screen.dart';
import 'package:firebase_project/utils/constants/colors.dart';
import 'package:firebase_project/utils/constants/font_styles.dart';
import 'package:firebase_project/utils/device/device_utility.dart';
import 'package:firebase_project/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import '../../authentication_service.dart';
import 'login_footer.dart';

class LoginFormWidget extends ConsumerStatefulWidget {
  final GlobalKey<FormBuilderState> formKey;
  const LoginFormWidget({
    super.key,
    required this.formKey,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _LoginFormWidgetState();
}

class _LoginFormWidgetState extends ConsumerState<LoginFormWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: widget.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FormBuilderTextField(
            style: FontStyles.montserratRegular14(),
            name: 'email',
            decoration: InputDecoration(
              labelText: 'Email',
              labelStyle: FontStyles.montserratRegular14(),
              prefixStyle: FontStyles.montserratRegular14(),
              prefixIcon: const Icon(
                Icons.email_outlined,
                color: AppColors.primary,
              ),
            ),
            // onChanged: (code) {
            //   if (code!.length == 10) {
            //     FocusScope.of(context).requestFocus(FocusNode());
            //   }
            // },
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(errorText: 'Email is required'),
            ]),
            keyboardType: TextInputType.emailAddress,
          ),
          SizedBox(height: 10.0.h),
          FormBuilderTextField(
            style: FontStyles.montserratRegular14(),
            name: 'password',
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'Password',
              labelStyle: FontStyles.montserratRegular14(),
              prefixStyle: FontStyles.montserratRegular14(),
              prefixIcon: const Icon(
                Icons.password_outlined,
                color: AppColors.primary,
              ),
              suffixIcon: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.visibility_off_outlined),
                color: AppColors.primary,
              ),
            ),
            // onChanged: (code) {
            //   if (code!.length == 10) {
            //     FocusScope.of(context).requestFocus(FocusNode());
            //   }
            // },
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(errorText: 'Email is required'),
            ]),
            keyboardType: TextInputType.visiblePassword,
          ),
        ],
      ),
    );
  }
}
