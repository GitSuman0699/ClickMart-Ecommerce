import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class PhoneInput extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  const PhoneInput({super.key, required this.formKey});

  @override
  State<PhoneInput> createState() => _PhoneInputState();
}

class _PhoneInputState extends State<PhoneInput> {
  TextEditingController controller = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  PhoneNumber number = PhoneNumber(isoCode: 'IN');

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: InternationalPhoneNumberInput(
        onInputChanged: (number) {
          if (number.parseNumber().length == 10) {
            getPhoneNumber(number.phoneNumber.toString());
          }

          // print(this.number);
        },

        // onInputValidated: (bool value) {
        //   print(value);
        // },
        maxLength: 10,
        validator: FormBuilderValidators.compose([
          FormBuilderValidators.required(),
        ]),
        spaceBetweenSelectorAndTextField: 0.0,
        selectorConfig: const SelectorConfig(
          selectorType: PhoneInputSelectorType.DIALOG,
          leadingPadding: 10.0,
          showFlags: true,
          setSelectorButtonAsPrefixIcon: true,
        ),
        ignoreBlank: false,
        autoValidateMode: AutovalidateMode.disabled,
        selectorTextStyle: const TextStyle(color: Colors.black),
        initialValue: number,
        textFieldController: controller,
        formatInput: false,
        keyboardType:
            const TextInputType.numberWithOptions(signed: true, decimal: false),
        inputDecoration: const InputDecoration(
          border: InputBorder.none,
          hintText: '9898989898',
        ),
        onSaved: (PhoneNumber number) {
          print(number);
          // getPhoneNumber(number.phoneNumber.toString());
        },
      ),
    );
  }

  void getPhoneNumber(String phoneNumber) async {
    PhoneNumber number =
        await PhoneNumber.getRegionInfoFromPhoneNumber(phoneNumber, ' ');

    setState(() {
      this.number = number;
    });
  }
}
