// ignore_for_file: constant_identifier_names, non_constant_identifier_names, unused_import, unused_local_variable, use_build_context_synchronously, avoid_print

import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/features/auth/registration/controller/cubit/registration_cubit.dart';
import 'package:flutter_project/features/dashboard/modules/users/model/repo/local_db_data.dart';
import 'package:flutter_project/theme.dart';
import 'package:flutter_project/core/utilities/validation.dart';
import 'package:flutter_project/features/auth/login/view/page/login_page.dart';

// ignore: must_be_immutable
class RegistrationRequiredFieldsWidget extends StatelessWidget {
  const RegistrationRequiredFieldsWidget({super.key, required this.controller});
  final RegistrationCubit controller;

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: controller,
      child: BlocBuilder<RegistrationCubit, RegistrationState>(
        builder: (context, state) {
          return SingleChildScrollView(
            child: Form(
              key: controller.formKey,
              child: Column(
                children: [
                  const SizedBox(
                    height: 100,
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
                  Padding(
                    padding: DefaultHorizontalPadding,
                    child: TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: controller.emailController,
                      keyboardType: TextInputType.emailAddress,
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
                      controller: controller.passwordController,
                      keyboardType: TextInputType.visiblePassword,
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
                  Padding(
                    padding: DefaultHorizontalPadding,
                    child: TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: controller.confirmPasswordController,
                      keyboardType: TextInputType.visiblePassword,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'required field';
                        } else if (value !=
                            controller.passwordController.text) {
                          return 'Passwords do not match';
                        }
                        return null;
                      },
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
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(PrimaryColor)),
                      onPressed: () async {
                        // await (await DatabaseRepo.instance)
                        //     .insert(name: 'Ahmed', address: 'Cairo');
                        // log('Added successfully');
                        //  controller.onPressedConfirmButton(context),
                        try {
                          final credential = await FirebaseAuth.instance
                              .createUserWithEmailAndPassword(
                            email: controller.emailController.text.trim(),
                            password: controller.passwordController.text.trim(),
                          );
                          Navigator.of(context).pushReplacementNamed('Auth');
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'weak-password') {
                            print('The password provided is too weak.');
                          } else if (e.code == 'email-already-in-use') {
                            print('The account already exists for that email.');
                          }
                        } catch (e) {
                          print(e);
                        }
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
