// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/features/auth/onboarding/controller/cubit/onboarding_controller_cubit.dart';
import 'package:flutter_project/theme.dart';

class OnboardingButtonsWidget extends StatelessWidget {
  OnboardingButtonsWidget({super.key, required this.controller});
  OnboardingControllerCubit controller;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardingControllerCubit, OnboardingControllerState>(
      builder: (context, state) {
        OnboardingControllerCubit controller =
            context.read<OnboardingControllerCubit>();
        return Padding(
          padding: DefaultPadding,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Skip Button
              SizedBox(
                width: 100.0,
                height: 45.0,
                child: FilledButton(
                  style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(PrimaryColor)),
                  onPressed: () {
                    controller.onCallSkip(context);
                  },
                  child: Text(
                    'Skip',
                    style: textButton.copyWith(color: Colors.white),
                  ),
                ),
              ),
              // Next Button
              SizedBox(
                width: 100.0,
                height: 45.0,
                child: FilledButton(
                  style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(PrimaryColor)),
                  onPressed: () {
                    controller.onChangeToNext();
                  },
                  child: Text(
                    'Next',
                    style: textButton.copyWith(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
