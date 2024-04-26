//import 'dart:ffi';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/features/auth/login/view/page/login_page.dart';
import 'package:flutter_project/features/auth/onboarding/model/onboarding_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
//import 'package:meta/meta.dart';

part 'onboarding_controller_state.dart';

class OnboardingControllerCubit extends Cubit<OnboardingControllerState> {
  OnboardingControllerCubit() : super(OnboardingControllerInitial());

  PageController pageController = PageController();

  void onChangeToNext(BuildContext context) {
    if (pageController.page == data.length - 1) {
      onCallSkip(context);
    } else {
      pageController.nextPage(
        duration: const Duration(microseconds: 500),
        curve: Curves.linear,
      );
    }
  }

  Future<void> onCallSkip(BuildContext context) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setBool('onboarding', true);

    Navigator.push(
      // ignore: use_build_context_synchronously
      context,
      MaterialPageRoute<void>(
        builder: (BuildContext context) => const LoginPage(),
      ),
    );
  }

  List data = [
    OnboardingModel(
      title: 'Welcome to our To-Do-List!',
      description: 'Manage your tasks easily with our app.',
      img: 'assets/images/to-do-list.png',
    ),
    OnboardingModel(
      title: 'Add Tasks',
      description: 'Easily add tasks and organize them.',
      img: 'assets/images/multitasking.png',
    ),
    OnboardingModel(
      title: 'Stay Organized',
      description: 'Keep track of your tasks and stay productive.',
      img: 'assets/images/urgent.png',
    )
  ];
}
