// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
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
            height: 50,
          ),
          Padding(
            padding: DefaultHorizontalPadding,
            child: Text(
              "Create account",
              style: titleText,
            ),
          ),
          const SizedBox(
            height: 5,
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
                    "Log in",
                    style: textButton.copyWith(
                        decoration: TextDecoration.underline,
                        decorationThickness: 1),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: DefaultPadding,
            child: TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: TextEditingController(),
              keyboardType: TextInputType.name,
              validator: MyValidation().nameValidate,
              obscureText: false,
              decoration: decoration.copyWith(hintText: "First Name"),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: DefaultPadding,
            child: TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: TextEditingController(),
              keyboardType: TextInputType.name,
              validator: MyValidation().nameValidate,
              obscureText: false,
              decoration: decoration.copyWith(hintText: "Last Name"),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: DefaultPadding,
            child: TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: TextEditingController(),
              keyboardType: TextInputType.name,
              validator: MyValidation().emailValidate,
              obscureText: false,
              decoration: decoration.copyWith(
                  hintText: "Email",
                  prefixIcon: const Icon(Icons.email_outlined)),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: DefaultPadding,
            child: TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: TextEditingController(),
              keyboardType: TextInputType.name,
              validator: MyValidation().passwordValidate,
              obscureText: true,
              decoration: decoration.copyWith(
                  hintText: "Password", prefixIcon: const Icon(Icons.lock)),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: DefaultPadding,
            child: TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: TextEditingController(),
              keyboardType: TextInputType.name,
              validator: MyValidation().passwordValidate,
              obscureText: true,
              decoration: decoration.copyWith(
                  hintText: "Confirm Password",
                  prefixIcon: const Icon(Icons.lock)),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          SizedBox(
            width: 200,
            height: 50,
            child: FilledButton(
              style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(PrimaryColor)),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const LoginPage()));
              },
              child: const Text("Confirm"),
            ),
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

const PrimaryColor = Color.fromARGB(255, 1, 69, 72);
const SecondaryColor = Color.fromARGB(255, 74, 153, 147);
const FocusedColor = Color(0xFF14292B);
const ErrorColor = Color(0xFFFF1E1E);

const DefaultHorizontalPadding = EdgeInsets.symmetric(horizontal: 30);
const DefaultVerticallPadding = EdgeInsets.symmetric(vertical: 5);
const DefaultPadding = EdgeInsets.all(10);

TextStyle titleText = const TextStyle(
    color: PrimaryColor, fontSize: 32, fontWeight: FontWeight.w700);
TextStyle subTitle = const TextStyle(
    color: SecondaryColor, fontSize: 18, fontWeight: FontWeight.w500);
TextStyle textButton = const TextStyle(
  color: PrimaryColor,
  fontSize: 18,
  fontWeight: FontWeight.w700,
);
