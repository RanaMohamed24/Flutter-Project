import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/features/auth/onboarding/controller/cubit/onboarding_controller_cubit.dart';
import 'package:flutter_project/features/auth/onboarding/view/components/onboarding_buttons.dart';
import 'package:flutter_project/features/auth/onboarding/view/components/onboarding_widget.dart';
//import 'package:flutter/widgets.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider<OnboardingControllerCubit>(
        create: (context) => OnboardingControllerCubit(),
        child:
            BlocBuilder<OnboardingControllerCubit, OnboardingControllerState>(
          builder: (context, state) {
            OnboardingControllerCubit controller =
                context.read<OnboardingControllerCubit>();
            return Scaffold(
              body: OnboardingWidget(
                controller: controller,
              ),
              bottomNavigationBar: OnboardingButtonsWidget(
                controller: controller,
              ),
            );
          },
        ),
      ),
    );
  }
}
