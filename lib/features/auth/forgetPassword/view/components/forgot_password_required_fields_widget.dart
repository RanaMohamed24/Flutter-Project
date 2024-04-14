// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_project/core/utilities/validation.dart';
import 'package:flutter_project/features/auth/forgetPassword/view/page/reset_pasword.dart';
import 'package:flutter_project/theme.dart';

class ForgotPasswordRequiredFieldsWidget extends StatelessWidget {
  const ForgotPasswordRequiredFieldsWidget({Key? key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: DefaultPadding,
      child: Column(
        children: [
          const SizedBox(
            height: 200,
          ),
          Padding(
            padding: DefaultHorizontalPadding,
            child: Text(
              'Forget Password',
              style: titleText,
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Padding(
            padding: DefaultHorizontalPadding,
            child: Row(
              children: [
                Text(
                  'Please enter your email address',
                  style: subTitle,
                ),
              ],
            ),
          ),
          const SizedBox(height: 5),
          Padding(
            padding: DefaultHorizontalPadding,
            child: TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: TextEditingController(),
              keyboardType: TextInputType.emailAddress,
              validator: MyValidation().emailValidate,
              decoration: TextFieldDecoration.copyWith(
                hintText: "Email",
                prefixIcon: const Icon(Icons.email_outlined),
              ),
            ),
          ),
          const SizedBox(height: 30),
          Center(
            child: Padding(
              padding: DefaultHorizontalPadding,
              child: SizedBox(
                width: 350.0,
                height: 50.0,
                child: FilledButton(
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(PrimaryColor),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ResetPasswordPage(),
                      ),
                    );
                  },
                  child: Text(
                    'Reset Password',
                    style: textButton.copyWith(color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
