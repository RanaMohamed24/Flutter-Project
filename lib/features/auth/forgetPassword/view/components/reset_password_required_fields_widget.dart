// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_project/theme.dart';
import 'package:flutter_project/core/utilities/validation.dart';
import 'package:flutter_project/features/auth/login/view/page/login_page.dart';

class ResetPasswordRequiredFieldsWidget extends StatelessWidget {
  const ResetPasswordRequiredFieldsWidget({Key? key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 200,
          ),
          Padding(
            padding: DefaultHorizontalPadding,
            child: Text(
              'Reset Password',
              style: titleText,
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Padding(
            padding: DefaultHorizontalPadding,
            child: TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: TextEditingController(),
              keyboardType: TextInputType.name,
              validator: MyValidation().passwordValidate,
              obscureText: true,
              decoration: TextFieldDecoration.copyWith(
                hintText: "New Password",
                prefixIcon: const Icon(Icons.lock),
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: DefaultHorizontalPadding,
            child: TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: TextEditingController(),
              keyboardType: TextInputType.name,
              validator: MyValidation().passwordValidate,
              obscureText: true,
              decoration: TextFieldDecoration.copyWith(
                hintText: "Confirm Password",
                prefixIcon: const Icon(Icons.lock),
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
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
                        builder: (context) => const LoginPage(),
                      ),
                    );
                  },
                  child: Text(
                    'Confirm',
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
