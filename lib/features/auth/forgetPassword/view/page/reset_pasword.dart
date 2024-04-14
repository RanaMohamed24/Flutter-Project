import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/features/auth/forgetPassword/controller/cubit/reset_password_cubit.dart';
import 'package:flutter_project/features/auth/forgetPassword/view/components/reset_password_required_fields_widget.dart';

class ResetPasswordPage extends StatelessWidget {
  const ResetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider<ResetPasswordCubit>(
        create: (context) => ResetPasswordCubit(),
        child: BlocBuilder<ResetPasswordCubit, ResetPasswordState>(
          builder: (context, state) {
            final ResetPasswordCubit controller =
                context.read<ResetPasswordCubit>();
            return Scaffold(
              body: ResetPasswordRequiredFieldsWidget(
                controller: controller,
              ),
            );
          },
        ),
      ),
    );
  }
}
