// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/features/auth/resetPassword/controller/cubit/reset_password_cubit.dart';
import 'package:flutter_project/core/utilities/theme.dart';
import 'package:flutter_project/core/utilities/validation.dart';

class ResetPasswordRequiredFieldsWidget extends StatelessWidget {
  const ResetPasswordRequiredFieldsWidget({Key? key, required this.controller});
  final ResetPasswordCubit controller;

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: controller,
      child: BlocBuilder<ResetPasswordCubit, ResetPasswordState>(
        builder: (context, state) {
          return SingleChildScrollView(
            child: Form(
              key: controller.formKey,
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
                      controller: controller.passwordController,
                      keyboardType: TextInputType.visiblePassword,
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
                            backgroundColor:
                                MaterialStatePropertyAll(PrimaryColor),
                          ),
                          onPressed: () =>
                              controller.onPressedConfirmButton(context),
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
            ),
          );
        },
      ),
    );
  }
}
