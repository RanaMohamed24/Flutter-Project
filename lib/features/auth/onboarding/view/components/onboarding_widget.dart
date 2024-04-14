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
        const Text('Welcome to our App'),
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
                          Image.asset(controller.data[index].img),
                          Text(
                            controller.data[index].title,
                            style: onboardingTitle,
                          ),
                          Text(
                            controller.data[index].subtitle,
                            style: subTitle,
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
