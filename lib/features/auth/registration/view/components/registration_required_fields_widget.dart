// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/features/auth/registration/controller/cubit/registration_cubit.dart';
import 'package:flutter_project/features/auth/verfication/view/page/verfication.dart';
import 'package:flutter_project/theme.dart';
import 'package:flutter_project/core/utilities/validation.dart';
import 'package:flutter_project/features/auth/login/view/page/login_page.dart';

// ignore: must_be_immutable
class RegistrationRequiredFieldsWidget extends StatelessWidget {
  RegistrationRequiredFieldsWidget({super.key, required this.controller});
  RegistrationCubit controller;
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: controller,
      child: BlocBuilder<RegistrationCubit, RegistrationState>(
        builder: (context, state) {
          RegistrationCubit controller = context.read<RegistrationCubit>();
          return SingleChildScrollView(
            child: Form(
              key: controller.formKey,
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
                  // First name
                  Padding(
                    padding: DefaultHorizontalPadding,
                    child: TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: controller.firstNameController,
                      keyboardType: TextInputType.name,
                      validator: MyValidation().nameValidate,
                      obscureText: false,
                      decoration:
                          TextFieldDecoration.copyWith(hintText: "First Name"),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  // Last Name
                  Padding(
                    padding: DefaultHorizontalPadding,
                    child: TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: controller.lastNameController,
                      keyboardType: TextInputType.name,
                      validator: MyValidation().nameValidate,
                      obscureText: false,
                      decoration:
                          TextFieldDecoration.copyWith(hintText: "Last Name"),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  // Email
                  Padding(
                    padding: DefaultHorizontalPadding,
                    child: TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: controller.emailController,
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
                  // Password
                  Padding(
                    padding: DefaultHorizontalPadding,
                    child: TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: controller.passwordController,
                      keyboardType: TextInputType.name,
                      validator: MyValidation().passwordValidate,
                      obscureText: true,
                      decoration: TextFieldDecoration.copyWith(
                          hintText: "Password",
                          prefixIcon: const Icon(Icons.lock)),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  // Confirm Password
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
                  // confirm Button
                  SizedBox(
                    width: 350.0,
                    height: 50.0,
                    child: FilledButton(
                      style: const ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(PrimaryColor)),
                      onPressed: () {
                        controller.onPressedConfirmButton();
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const VerificationPage()));
                      },
                      child: Text(
                        'Confirm',
                        style: textButton.copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
