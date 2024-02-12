import 'package:firebase_project/utils/constants/colors.dart';
import 'package:firebase_project/utils/constants/font_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class PhoneInput extends StatefulWidget {
  final GlobalKey<FormBuilderState> formKey;
  const PhoneInput({super.key, required this.formKey});

  @override
  State<PhoneInput> createState() => _PhoneInputState();
}

class _PhoneInputState extends State<PhoneInput> {
  TextEditingController controller = TextEditingController();
  PhoneNumber number = PhoneNumber(isoCode: 'IN');

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: widget.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // const Text(
          //   'Kindly enter your 10-digit mobile number and verify using OTP.',
          // ),
          // UIHelper.verticalSpaceMedium(),
          FormBuilderTextField(
            style: FontStyles.montserratRegular14(),
            name: 'mobile',
            decoration: InputDecoration(
              labelText: '10-digit mobile number',
              labelStyle: FontStyles.montserratRegular14(),
              prefixText: "+91 ",
              prefixStyle: FontStyles.montserratRegular14(),
              prefixIcon: const Icon(
                Icons.phone_android_outlined,
                color: AppColors.primary,
              ),
            ),
            onChanged: (code) {
              if (code!.length == 10) {
                FocusScope.of(context).requestFocus(FocusNode());
              }
            },
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(
                  errorText: 'Mobile number is requied'),
              FormBuilderValidators.numeric(),
              FormBuilderValidators.maxLength(10,
                  errorText: 'Mobile number should be of 10 digit'),
              FormBuilderValidators.minLength(10,
                  errorText: 'Mobile number should be of 10 digit'),
            ]),
            keyboardType: TextInputType.number,
          ),
          // UIHelper.verticalSpaceLarge(),
          // UIHelper.verticalSpaceLarge(),
          // ElevatedButton(
          //   style: ElevatedButton.styleFrom(
          //     backgroundColor: AppColors.primary,
          //     minimumSize: const Size(
          //       double.infinity,
          //       45,
          //     ),
          //     // primary: AppColors.primaryColor,
          //     elevation: 1,
          //   ),
          //   onPressed: () async {
          //     await EasyLoading.show(
          //       status: 'loading...',
          //       maskType: EasyLoadingMaskType.clear,
          //     );
          //     formKey.currentState!.save();
          //     if (formKey.currentState!.validate()) {
          //       ref
          //           .watch(proceedLogin({
          //         "mobile": formKey.currentState!.fields['mobile']!.value,
          //         "signature": await generateRandomString(11),
          //       }).future)
          //           .then((value) {
          //         if (value['is_user']) {
          //           EasyLoading.dismiss();
          //           Navigator.pushNamed(context, "/otp_view",
          //               arguments: formKey.currentState!.value['mobile']);
          //         } else {
          //           EasyLoading.dismiss();
          //           EasyLoading.showToast(value['message']);
          //         }

          //         // if (value['user_exist'] == false) {
          //         //   EasyLoading.dismiss();
          //         //   Navigator.pushNamed(context, "/profile_view",
          //         //       arguments: formKey.currentState!.value['mobile']);
          //         // } else if (value['user_exist'] == true &&
          //         //     value['is_buyer'] == false) {
          //         //   EasyLoading.dismiss();
          //         //   showToast(msg: value['message']);
          //         // } else if (value['is_buyer'] == true) {
          //         //   if (value['user_status'] != 1) {
          //         //     EasyLoading.dismiss();
          //         //     showToast(msg: value['message']);
          //         //   } else {
          //         //     EasyLoading.dismiss();
          //         //     Navigator.pushNamed(context, "/otp_view",
          //         //         arguments:
          //         //             formKey.currentState!.value['mobile']);
          //         //   }
          //         // }
          //       });
          //     } else {
          //       EasyLoading.dismiss();

          //       showToast(msg: "Invalid Operation");
          //     }
          //   },
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: [
          //       Text(
          //         'Proceed',
          //         style: Theme.of(context).textTheme.bodyLarge!.copyWith(
          //               fontWeight: FontWeight.bold,
          //             ),
          //       ),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
    // Form(
    //   key: _formKey,
    //   child: InternationalPhoneNumberInput(
    //     onInputChanged: (number) {
    //       if (number.parseNumber().length == 10) {
    //         getPhoneNumber(number.phoneNumber.toString());
    //       }

    //       // print(this.number);
    //     },

    //     // onInputValidated: (bool value) {
    //     //   print(value);
    //     // },
    //     maxLength: 10,
    //     validator: FormBuilderValidators.compose([
    //       FormBuilderValidators.required(errorText: "This field is required"),
    //     ]),
    //     spaceBetweenSelectorAndTextField: 0.0,
    //     selectorConfig: const SelectorConfig(
    //       selectorType: PhoneInputSelectorType.DIALOG,
    //       leadingPadding: 10.0,
    //       showFlags: true,
    //       setSelectorButtonAsPrefixIcon: true,
    //     ),
    //     ignoreBlank: false,
    //     autoValidateMode: AutovalidateMode.disabled,
    //     selectorTextStyle: const TextStyle(color: Colors.black),
    //     initialValue: number,
    //     textFieldController: controller,
    //     formatInput: false,
    //     keyboardType:
    //         const TextInputType.numberWithOptions(signed: true, decimal: false),
    //     inputDecoration: const InputDecoration(
    //       border: InputBorder.none,
    //       hintText: '9898989898',
    //     ),
    //     onSaved: (PhoneNumber number) {
    //       print(number);
    //       // getPhoneNumber(number.phoneNumber.toString());
    //     },
    //   ),
    // );
  }

  void getPhoneNumber(String phoneNumber) async {
    PhoneNumber number =
        await PhoneNumber.getRegionInfoFromPhoneNumber(phoneNumber, ' ');

    setState(() {
      this.number = number;
    });
  }
}
