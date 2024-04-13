import 'package:flutter/material.dart';
import 'package:flutter_project/features/auth/forgetPassword/view/components/forgot_password_required_fields_widget.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: ForgotPasswordRequiredFieldsWidget(),
      ),
    );
  }
}
