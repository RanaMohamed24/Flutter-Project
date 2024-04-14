import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/features/auth/login/controller/cubit/login_cubit.dart';
import 'package:flutter_project/features/auth/login/view/components/required_body_widget.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider<LoginCubit>(
        create: (context) => LoginCubit(),
        child: BlocBuilder<LoginCubit, LoginState>(
          builder: (context, state) {
            final LoginCubit controller =
                context.read<LoginCubit>();
            return Scaffold(
              body: RequiredBodyWidget(
                controller: controller,
              ),
            );
          },
        ),
      ),
    );
  }
}
