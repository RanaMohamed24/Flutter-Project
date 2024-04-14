import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/features/auth/verfication/cubit/verification_cubit.dart';
import 'package:flutter_project/features/auth/verfication/view/components/verfication_required_fields_widget.dart';

class VerificationPage extends StatelessWidget {
  const VerificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider<VerificationCubit>(
        create: (context) => VerificationCubit(),
        child: BlocBuilder<VerificationCubit, VerificationState>(
          builder: (context, state) {
            final VerificationCubit controller =
                context.read<VerificationCubit>();
            return Scaffold(
              body: VerificationRequiredFieldsWidget(
                controller: controller,
              ),
            );
          },
        ),
      ),
    );
  }
}
