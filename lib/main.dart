// ignore_for_file: unused_local_variable, non_constant_identifier_names, deprecated_member_use, use_key_in_widget_constructors

import 'package:device_preview/device_preview.dart';
import "package:flutter/material.dart";
import 'package:flutter_project/core/firebase/my-firebase.dart';
import 'package:flutter_project/core/utilities/my_routes.dart';
import 'package:flutter_project/features/auth/onboarding/view/page/onboarding.dart';
import 'package:flutter_project/features/dashboard/view/page/dashboard_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  await MyFirebase().init();
  bool onBoarding = sharedPreferences.getBool('onboarding') ?? false;
  MaterialApp materialApp = MaterialApp(
    builder: DevicePreview.appBuilder,
    onGenerateRoute: MyRoutes.onGenerateRoute,
    useInheritedMediaQuery: true,
    onGenerateInitialRoutes: (_) => [
      MaterialPageRoute<dynamic>(
        builder: (BuildContext context) =>
            onBoarding ? const DashboardPage() : const OnBoardingPage(),
      ),
    ],
  );

  runApp(
    DevicePreview(
      enabled: false,
      builder: (context) => materialApp, // Wrap your app
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: DashboardPage(),
    );
  }
}
