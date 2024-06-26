import 'package:flutter/material.dart';
//import 'package:flutter_project/features/Home.dart';
import 'package:flutter_project/features/auth/forgetPassword/view/page/forgot_password.dart';
import 'package:flutter_project/features/auth/login/controller/auth.dart';
import 'package:flutter_project/features/auth/resetPassword/view/page/reset_pasword.dart';
import 'package:flutter_project/features/auth/login/view/page/login_page.dart';
import 'package:flutter_project/features/auth/onboarding/view/page/onboarding.dart';
import 'package:flutter_project/features/auth/registration/view/page/registration.dart';
import 'package:flutter_project/features/auth/verfication/view/page/verfication.dart';
import 'package:flutter_project/features/dashboard/modules/Tasks/view/page/Tasks_page.dart';
import 'package:flutter_project/features/dashboard/modules/add_task/view/page/add_tasks_page.dart';
import 'package:flutter_project/features/dashboard/modules/categories/view/page/categories_tasks_page.dart';
import 'package:flutter_project/features/dashboard/modules/manage_categories/view/page/manage_categories_page.dart';
import 'package:flutter_project/features/dashboard/modules/profile/view/page/profile_page.dart';
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
      case 'Auth':
        return MaterialPageRoute<dynamic>(
          builder: (BuildContext context) => const Auth(),
        );
      case 'Dashboard':
        return MaterialPageRoute<dynamic>(
          builder: (BuildContext context) =>  DashboardPage(),
        );
      case 'Tasks':
        return MaterialPageRoute<dynamic>(
          builder: (BuildContext context) =>  const TasksPage(),
        );
      case 'CategoriesTasks':
        return MaterialPageRoute<dynamic>(
          builder: (BuildContext context) =>  const CategoriesTasksPage(),
        );
      case 'Profile':
        return MaterialPageRoute<dynamic>(
          builder: (BuildContext context) =>  const ProfilePage(),
        );
      case 'addTask':
        return MaterialPageRoute<dynamic>(
          builder: (BuildContext context) => const AddTasksPage(),
        );
      case 'manageCategories':
        return MaterialPageRoute<dynamic>(
          builder: (BuildContext context) => const ManageCategoriesPage(),
        );

      default:
        return MaterialPageRoute<dynamic>(
          builder: (BuildContext context) => const Auth(),
        );
    }
  }
}
