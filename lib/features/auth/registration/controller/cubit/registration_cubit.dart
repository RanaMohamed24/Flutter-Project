import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
//import 'package:meta/meta.dart';

part 'registration_state.dart';

class RegistrationCubit extends Cubit<RegistrationState> {
  RegistrationCubit() : super(RegistrationInitial());
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void onPressedConfirmButton(BuildContext context) {
    if (formKey.currentState!.validate()) {
      Navigator.pushNamed(context, 'login');
    } else {
      log('invalid inputs');
    }
  }
}
