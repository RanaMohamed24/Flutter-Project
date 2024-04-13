import 'package:flutter/material.dart';
import 'package:flutter_project/features/auth/registration/view/components/registration_required_fields_widget.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: RegistrationRequiredFieldsWidget(),
      ),
    );
  }
}
