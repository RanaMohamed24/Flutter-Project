import 'package:flutter/material.dart';
import 'package:flutter_project/features/Home.dart';
import 'package:flutter_project/features/auth/forgetPassword/view/page/forgot_password.dart';
import 'package:flutter_project/features/auth/resetPassword/view/page/reset_pasword.dart';
import 'package:flutter_project/features/auth/login/view/page/login_page.dart';
import 'package:flutter_project/features/auth/onboarding/view/page/onboarding.dart';
import 'package:flutter_project/features/auth/registration/view/page/registration.dart';
import 'package:flutter_project/features/auth/verfication/view/page/verfication.dart';
import 'package:flutter_project/features/dashboard/view/page/dashboard_page.dart';

class MyRoutes {
  static List<Route> initRoutes = [
    MaterialPageRoute<dynamic>(
      builder: (BuildContext context) => const LoginPage(),
    ),
  ];

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case 'login':
        return MaterialPageRoute<dynamic>(
          builder: (BuildContext context) => const LoginPage(),
        );
      case 'registration':
        return MaterialPageRoute<dynamic>(
          builder: (BuildContext context) => const RegistrationPage(),
        );
      case 'forgetPassword':
        return MaterialPageRoute<dynamic>(
          builder: (BuildContext context) => const ForgotPasswordPage(),
        );
      case 'resetPassword':
        return MaterialPageRoute<dynamic>(
          builder: (BuildContext context) => const ResetPasswordPage(),
        );
      case 'verfication':
        return MaterialPageRoute<dynamic>(
          builder: (BuildContext context) => const VerificationPage(),
        );
      case 'onboarding':
        return MaterialPageRoute<dynamic>(
          builder: (BuildContext context) => const OnBoardingPage(),
        );
        case 'Home':
        return MaterialPageRoute<dynamic>(
          builder: (BuildContext context) => DashboardPage(),
        );
      default:
        return MaterialPageRoute<dynamic>(
          builder: (BuildContext context) => const Home(),
        );
    }
  }
}
