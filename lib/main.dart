// ignore_for_file: unused_local_variable, non_constant_identifier_names

import 'package:animated_splash_screen/animated_splash_screen.dart';
import "package:flutter/material.dart";
import 'package:flutter_project/features/auth/login/view/page/login_page.dart';
import 'package:flutter_project/features/auth/onboarding/view/page/onboarding.dart';
import 'package:flutter_project/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

  bool onBoarding = sharedPreferences.getBool('onboarding') ?? false;
  MaterialApp materialApp =  MaterialApp(
      //home: onBoarding ? const LoginPage() : const OnBoardingPage(),
      onGenerateRoute:OnGenerateRoute ,
      onGenerateInitialRoutes:(_)=>[
        MaterialPageRoute<dynamic>(
        builder: (BuildContext context) => const SplashScreen(),
      ),
      ] ,
      );
  runApp(materialApp);
}
Route<dynamic>OnGenerateRoute(RouteSettings settings) {
if(settings.name=='login'){
  return MaterialPageRoute<dynamic>(
        builder: (BuildContext context) => const LoginPage(),
      );
}
else{
   return MaterialPageRoute<dynamic>(
        builder: (BuildContext context) => const OnBoardingPage(),
      );
}
}

 class MyApp extends StatelessWidget {
   const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/image/icons8-to-do-list.gif",
              ),
              const Text(
                "To-Do List",
                style: TextStyle(
                    color: PrimaryColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              )
            ],
        ),
      ),
      backgroundColor: Colors.white,
      nextScreen: const LoginPage(),
      duration: 4000,
    );
  }
}

