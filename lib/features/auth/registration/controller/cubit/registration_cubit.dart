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

  void onPressedConfirmButton() {
    if (formKey.currentState!.validate()) {
      log(firstNameController.text);
      log(lastNameController.text);
      log(emailController.text);
      
    } else {
      log('invalid inputs');
    }
  }
}
