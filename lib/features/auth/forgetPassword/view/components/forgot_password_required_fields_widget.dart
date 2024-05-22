// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/core/utilities/validation.dart';
import 'package:flutter_project/features/auth/forgetPassword/controller/cubit/forget_password_cubit.dart';
import 'package:flutter_project/core/utilities/theme.dart';

class ForgotPasswordRequiredFieldsWidget extends StatelessWidget {
  const ForgotPasswordRequiredFieldsWidget(
      {Key? key, required this.controller});
  final ForgetPasswordCubit controller;

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: controller,
      child: BlocBuilder<ForgetPasswordCubit, ForgetPasswordState>(
        builder: (context, state) {
          return SingleChildScrollView(
            padding: DefaultPadding,
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
                      controller: controller.emailController,
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
                            backgroundColor:
                                MaterialStatePropertyAll(PrimaryColor),
                          ),
                          onPressed: () =>
                              controller.onPressedConfirmButton(context),
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
            ),
          );
        },
      ),
    );
  }
}
