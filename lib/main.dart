import 'package:animated_splash_screen/animated_splash_screen.dart';
import "package:flutter/material.dart";
import 'package:flutter_project/features/auth/login/view/page/login_page.dart';
<<<<<<< HEAD
import 'package:flutter_project/features/auth/registration/view/page/registration.dart';
import 'package:lottie/lottie.dart'; // Adjust the import path
=======
>>>>>>> 422716727f1721c31c2f2cd307ef49e256d12d5b
import 'package:flutter_project/features/auth/onboarding/view/page/onboarding.dart';
import 'package:flutter_project/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

  bool onBoarding = sharedPreferences.getBool('onboarding') ?? false;

<<<<<<< HEAD
  MaterialApp materialApp =  MaterialApp(
      //home: onBoarding ? const LoginPage() : const OnBoardingPage(),
      onGenerateRoute:OnGenerateRoute ,
      onGenerateInitialRoutes:(_)=>[
        MaterialPageRoute<dynamic>(
        builder: (BuildContext context) => const OnBoardingPage(),
      ),
      MaterialPageRoute<dynamic>(
        builder: (BuildContext context) => const RegistrationPage(),
      )

      ] ,
      );
=======
  MaterialApp materialApp = MaterialApp(
      home: onBoarding ? const SplashScreen() : const OnBoardingPage());
>>>>>>> 422716727f1721c31c2f2cd307ef49e256d12d5b
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
      debugShowCheckedModeBanner: false,
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
