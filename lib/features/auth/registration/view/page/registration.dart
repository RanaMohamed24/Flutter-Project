import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/features/auth/registration/controller/cubit/registration_cubit.dart';
import 'package:flutter_project/features/auth/registration/view/components/registration_required_fields_widget.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider<RegistrationCubit>(
        create: (context) => RegistrationCubit(),
        child: BlocBuilder<RegistrationCubit, RegistrationState>(
          builder: (context, state) {
            final RegistrationCubit controller =
                context.read<RegistrationCubit>();
            return Scaffold(
              body: RegistrationRequiredFieldsWidget(
                controller: controller,
              ),
            );
          },
        ),
      ),
    );
  }
}
// half the screen width
// width: MediaQuery.of(context).size.width / 2;