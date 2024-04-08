import 'package:flutter/material.dart';
import 'package:flutter_project/features/auth/login/view/components/required_body_widget.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: RequiredBodyWidget(),
      ),
    );
  }
}
