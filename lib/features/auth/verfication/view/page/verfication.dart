import 'package:flutter/material.dart';
import 'package:flutter_project/features/auth/verfication/view/components/verfication_required_fields_widget.dart';

class VerificationPage extends StatelessWidget {
  const VerificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
        child: Scaffold(
      body: VerificationRequiredFieldsWidget(),
    ));
  }
}
