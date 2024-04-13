import 'package:flutter/material.dart';
import 'package:flutter_project/features/auth/forgetPassword/view/page/forgot_password.dart';
import 'package:flutter_project/features/auth/registration/view/page/registration.dart';
import 'package:flutter_project/theme.dart';
import 'package:flutter_project/core/utilities/validation.dart';

class RequiredBodyWidget extends StatelessWidget {
  const RequiredBodyWidget({super.key});

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
              'Welcome Back',
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
                'Create an account?',
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
                          builder: (context) => const RegistrationPage()));
                },
                child: Text(
                  "Signup",
                  style: textButton.copyWith(
                      decoration: TextDecoration.underline,
                      decorationThickness: 1),
                ),
              )
            ]),
          ),
          const SizedBox(
            height: 50,
          ),
          Padding(
            padding: DefaultHorizontalPadding,
            child: TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: TextEditingController(),
                keyboardType: TextInputType.emailAddress,
                validator: MyValidation().emailValidate,
                decoration: TextFieldDecoration.copyWith(hintText: "Email")),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: DefaultHorizontalPadding,
            child: TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: TextEditingController(),
                validator: MyValidation().passwordValidate,
                obscureText: true,
                decoration: TextFieldDecoration.copyWith(hintText: "Password")),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: DefaultHorizontalPadding,
            child: Row(children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ForgotPasswordPage()));
                },
                child: Text(
                  "Forget Password?",
                  style: textButton.copyWith(
                      decoration: TextDecoration.underline,
                      decorationThickness: 1),
                ),
              )
            ]),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: 350,
            height: 50,
            child: FilledButton(
              style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(PrimaryColor)),
              onPressed: () {
                //  Navigator.push(context,
                // MaterialPageRoute(builder: (context) => const ()));
              },
              child: Text(
                "Login",
                style: textButton.copyWith(color: Colors.white),
                ),
            ),
          )
        ],
      ),
    );
  }
}
