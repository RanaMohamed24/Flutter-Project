import 'package:flutter/material.dart';
import 'package:flutter_project/features/auth/forgetPassword/view/components/reset_password_required_fields_widget.dart';

class ResetPasswordPage extends StatelessWidget {
  const ResetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: const Scaffold(
        body: ResetPasswordRequiredFieldsWidget(),
      ),
    );
  }
}
