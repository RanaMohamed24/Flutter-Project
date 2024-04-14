import 'package:animated_splash_screen/animated_splash_screen.dart';
import "package:flutter/material.dart";
import 'package:flutter_project/features/auth/login/view/page/login_page.dart';
import 'package:lottie/lottie.dart'; // Adjust the import path
import 'package:flutter_project/features/auth/onboarding/view/page/onboarding.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

  bool onBoarding = sharedPreferences.getBool('onboarding') ?? false;

  MaterialApp materialApp = MaterialApp(
      home: onBoarding ? const LoginPage() : const OnBoardingPage());
  runApp(materialApp);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: AnimatedSplashScreen(
        splash:
            const SplashScreen(), // Use const and correct constructor syntax
        nextScreen: const LoginPage(),
      ),
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 250,
          height: 200,
          decoration: const BoxDecoration(
            color: Colors.white, // Set your desired background color here
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Make It Happen',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10), // Add some space between text and image
              SizedBox(
                width: 200, // Adjust the width as needed
                height: 200, // Adjust the height as needed
                child: Lottie.asset(
                  "assets/images/Animation - 1713048188750.json",
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


