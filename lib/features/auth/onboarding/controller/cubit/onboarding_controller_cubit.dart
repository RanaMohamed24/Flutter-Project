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

  void onChangeToNext() {
    pageController.nextPage(
      duration: const Duration(seconds: 1),
      curve: Curves.bounceIn,
    );
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
        img: 'assets/image/game-plan.png',
        title: 'Take Control of Your Day..',
        subtitle:
            'Make every day count - start planning now'),
    OnboardingModel(img: 'assets/image/goal.png', title: 'Focus on What Matters Most..', subtitle: 'Get organized and achieve your goals'),
    OnboardingModel(img: 'assets/image/break.png', title: 'From To-Do to Done!', subtitle: 'Get started now and unlock your full potential')
  ];
}
