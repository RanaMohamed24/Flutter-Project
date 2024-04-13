// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_project/theme.dart';
import 'package:flutter_project/core/utilities/validation.dart';
import 'package:flutter_project/features/auth/login/view/page/login_page.dart';


class RegistrationRequiredFieldsWidget extends StatelessWidget {
  const RegistrationRequiredFieldsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 150,
          ),
          Padding(
            padding: DefaultHorizontalPadding,
            child: Text(
              "Create account",
              style: titleText,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: DefaultHorizontalPadding,
            child: Row(
              children: [
                Text(
                  "Have an account?",
                  style: subTitle,
                ),
                const SizedBox(
                  width: 5,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginPage()));
                  },
                  child: Text(
                    "Login",
                    style: textButton.copyWith(
                        decoration: TextDecoration.underline,
                        decorationThickness: 1),
                  ),
                ),
              ],
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
              validator: MyValidation().nameValidate,
              obscureText: false,
              decoration: TextFieldDecoration.copyWith(hintText: "First Name"),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: DefaultHorizontalPadding,
            child: TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: TextEditingController(),
              keyboardType: TextInputType.name,
              validator: MyValidation().nameValidate,
              obscureText: false,
              decoration: TextFieldDecoration.copyWith(hintText: "Last Name"),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: DefaultHorizontalPadding,
            child: TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: TextEditingController(),
              keyboardType: TextInputType.name,
              validator: MyValidation().emailValidate,
              obscureText: false,
              decoration: TextFieldDecoration.copyWith(
                  hintText: "Email",
                  prefixIcon: const Icon(Icons.email_outlined)),
            ),
          ),
          const SizedBox(
            height: 20,
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
                  hintText: "Password", prefixIcon: const Icon(Icons.lock)),
            ),
          ),
          const SizedBox(
            height: 20,
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
                  prefixIcon: const Icon(Icons.lock)),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: 350.0,
            height: 50.0,
            child: FilledButton(
              style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(PrimaryColor)),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const LoginPage()));
              },
              child: Text(
                'Confirm',
                style: textButton.copyWith(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

