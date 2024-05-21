import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/features/Home.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void onPressedConfirmButton(BuildContext context) {
    if (formKey.currentState!.validate()) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Home()),
      );
    }
  }

  Future<void> LogIn(BuildContext context) async {
    try {
       emit(LoginLoading());
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      Navigator.of(context).pushReplacementNamed('Home');
      emit(LoginLoaded());
    } on FirebaseAuthException catch (e) {
      String error = _handleFirebaseAuthException(e);
         log('FirebaseAuthException: ${e.code}, Message: $error');  
         emit(LoginError(error));
    } catch (e) {
    log('Unexpected error: $e'); 
    emit(LoginError('An unexpected error occurred.'));
  }
    
  }
    String _handleFirebaseAuthException(FirebaseAuthException e) {
     log('Handling FirebaseAuthException with code: ${e.code}');
    switch (e.code) {
    case 'invalid-credential':
      return 'Invalid email or password. Please check them again.';
    case 'too-many-requests':
      return 'Invalid email or password. Please check them again.';
    default:
      return 'An unexpected error occurred.';
  }
  }
}
