
import 'package:flutter/material.dart';
import 'package:flutter_project/core/utilities/validation.dart';
import 'package:flutter_project/features/auth/forgetPassword/view/page/reset_pasword.dart';
import 'package:flutter_project/theme.dart';

class ForgotPasswordRequiredFieldsWidget extends StatelessWidget {
  const ForgotPasswordRequiredFieldsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: DefaultPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 200,
          ),
          Padding(
            padding: DefaultHorizontalPadding,
            child: Text(
              'Forgot Password',
              style: titleText,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Please enter your email address',
            style: subTitle.copyWith(fontWeight: FontWeight.w600),
          ),
          // SizedBox(
          //   height: 10,
          // ),
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: TextEditingController(),
              keyboardType: TextInputType.emailAddress,
              validator: MyValidation().emailValidate,
              decoration: decoration.copyWith(
                  hintText: "Email",
                  prefixIcon: const Icon(Icons.email_outlined)),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: DefaultHorizontalPadding,
            child: SizedBox(
                width: 200.0,
                height: 50.0,
                child: FilledButton(
                    style: const ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(PrimaryColor)),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ResetPasswordPage()));
                    },
                    child: const Text('Reset Password'))),
          ),
        ],
      ),
    );
  }
}

InputDecoration decoration = InputDecoration(
  hintText: "hint",
  hintStyle: const TextStyle(color: SecondaryColor),
  prefixIcon: const Icon(Icons.account_circle),
  border: UnderlineInputBorder(
      borderSide: const BorderSide(color: SecondaryColor),
      borderRadius: BorderRadius.circular(0)),
  focusedBorder: UnderlineInputBorder(
      borderSide: const BorderSide(color: PrimaryColor, width: 2),
      borderRadius: BorderRadius.circular(10)),
  errorBorder: UnderlineInputBorder(
      borderSide: const BorderSide(color: ErrorColor, width: 2),
      borderRadius: BorderRadius.circular(0)),
);

