import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/features/auth/forgetPassword/controller/cubit/forget_password_cubit.dart';
import 'package:flutter_project/features/auth/forgetPassword/view/components/forgot_password_required_fields_widget.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider<ForgetPasswordCubit>(
        create: (context) => ForgetPasswordCubit(),
        child: BlocBuilder<ForgetPasswordCubit, ForgetPasswordState>(
          builder: (context, state) {
            final ForgetPasswordCubit controller =
                context.read<ForgetPasswordCubit>();
            return Scaffold(
              body: ForgotPasswordRequiredFieldsWidget(
                controller: controller,
              ),
            );
          },
        ),
      ),
    );
  }
}
