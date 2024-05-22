// ignore_for_file: unused_local_variable, use_build_context_synchronously, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/features/auth/forgetPassword/view/page/forgot_password.dart';
import 'package:flutter_project/features/auth/login/controller/cubit/login_cubit.dart';
import 'package:flutter_project/features/auth/registration/view/page/registration.dart';
import 'package:flutter_project/core/utilities/theme.dart';
import 'package:flutter_project/core/utilities/validation.dart';

class RequiredBodyWidget extends StatelessWidget {
  const RequiredBodyWidget({super.key, required this.controller});
  final LoginCubit controller;

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
        value: controller,
        child: BlocListener<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state is LoginError) {
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(
                  SnackBar(content: Text(state.message)),
                );
            }
          },
          child: BlocBuilder<LoginCubit, LoginState>(
            builder: (context, state) {
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
                          'Welcome Back',
                          style: titleText,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: DefaultHorizontalPadding,
                        child: Row(children: [
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
                                      builder: (context) =>
                                          const RegistrationPage()));
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
                        height: 80,
                      ),
                      Padding(
                        padding: DefaultHorizontalPadding,
                        child: TextFormField(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            controller: controller.emailController,
                            keyboardType: TextInputType.emailAddress,
                            validator: MyValidation().emailValidate,
                            decoration: TextFieldDecoration.copyWith(
                                hintText: "Email",
                                prefixIcon: const Icon(Icons.email_outlined))),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: DefaultHorizontalPadding,
                        child: TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: controller.passwordController,
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
                        child: Row(children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const ForgotPasswordPage()));
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
                      Padding(
                        padding: DefaultHorizontalPadding,
                        child: SizedBox(
                          width: 150.0,
                          height: 50,
                          child: state is LoginLoading
                              ? const Center(child: CircularProgressIndicator())
                              : FilledButton(
                                  style: const ButtonStyle(
                                      backgroundColor: MaterialStatePropertyAll(
                                          PrimaryColor)),
                                  onPressed: () {
                                    controller.LogIn(context);
                                  },
                                  child: Text(
                                    "Login",
                                    style: textButton.copyWith(
                                        color: Colors.white),
                                  ),
                                ),
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ));
  }
}
