// ignore_for_file: unused_local_variable, non_constant_identifier_names, deprecated_member_use

import 'package:device_preview/device_preview.dart';
import "package:flutter/material.dart";
import 'package:flutter_project/core/utilities/my_routes.dart';
import 'package:flutter_project/features/auth/login/view/page/login_page.dart';
import 'package:flutter_project/features/auth/onboarding/view/page/onboarding.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

  bool onBoarding = sharedPreferences.getBool('onboarding') ?? false;
  MaterialApp materialApp = MaterialApp(
    builder: DevicePreview.appBuilder,
    onGenerateRoute: MyRoutes.onGenerateRoute,
    useInheritedMediaQuery: true,
    onGenerateInitialRoutes: (_) => [
      MaterialPageRoute<dynamic>(
        builder: (BuildContext context) =>
            onBoarding ? const LoginPage() : const OnBoardingPage(),
      ),
    ],
  );
  runApp(
    DevicePreview(
      enabled: true,
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
      home: LoginPage(),
    );
  }
}

// class SplashScreen extends StatelessWidget {
//   const SplashScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return AnimatedSplashScreen(
//       splash: SingleChildScrollView(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Image.asset(
//               "assets/image/icons8-to-do-list.gif",
//             ),
//             const Text(
//               "To-Do List",
//               style: TextStyle(
//                   color: PrimaryColor,
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold),
//             )
//           ],
//         ),
//       ),
//       backgroundColor: Colors.white,
//       nextScreen: const LoginPage(),
//       duration: 4000,
//     );
//   }
// }