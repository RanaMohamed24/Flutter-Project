// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_project/features/auth/onboarding/controller/cubit/onboarding_controller_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/theme.dart';

class OnboardingWidget extends StatelessWidget {
  OnboardingWidget({super.key, required this.controller});
  OnboardingControllerCubit controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: BlocProvider<OnboardingControllerCubit>.value(
            value: controller,
            child: BlocBuilder<OnboardingControllerCubit,
                OnboardingControllerState>(
              builder: (context, state) {
                OnboardingControllerCubit controller =
                    context.read<OnboardingControllerCubit>();
                return PageView(
                    controller: controller.pageController,
                    children: List.generate(controller.data.length, (index) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            controller.data[index].title,
                            style: onboardingTitle,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Center(
                            child: Padding(
                              padding: DefaultHorizontalPadding,
                              child: Text(
                                controller.data[index].description,
                                style: onboardingSubTitle,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          SizedBox(
                            width: 200,
                            height: 200,
                            child: Image.asset(controller.data[index].img),
                          ),
                        ],
                      );
                    }));
              },
            ),
          ),
        ),
      ],
    );
  }
}
