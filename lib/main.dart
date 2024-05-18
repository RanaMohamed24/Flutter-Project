import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/core/cubit/parent_cubit.dart';
import 'package:flutter_project/core/firebase/my-firebase.dart';
import 'package:flutter_project/core/utilities/my_routes.dart';
import 'package:flutter_project/features/auth/onboarding/view/page/onboarding.dart';
import 'package:flutter_project/features/dashboard/view/page/dashboard_page.dart';
import 'package:flutter_project/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  await MyFirebase().init();
  bool onBoarding = sharedPreferences.getBool('onboarding') ?? false;

  runApp(
    DevicePreview(
      enabled: false,
      builder: (context) => MyApp(onBoarding: onBoarding),
    ),
  );
}

class MyApp extends StatelessWidget {
  final bool onBoarding;

  const MyApp({super.key, required this.onBoarding});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ParentCubit.instance,
      child: BlocBuilder<ParentCubit, ParentState>(
        builder: (context, state) {
          return MaterialApp(
            builder: DevicePreview.appBuilder,
            onGenerateRoute: MyRoutes.onGenerateRoute,
            useInheritedMediaQuery: true,
            theme: MyTheme.instance.light,
            darkTheme: MyTheme.instance.dark,
            themeMode: ParentCubit.instance.themeMode,
            onGenerateInitialRoutes: (_) => [
              MaterialPageRoute<dynamic>(
                builder: (BuildContext context) =>
                    onBoarding ? DashboardPage() : const OnBoardingPage(),
              ),
            ],
          );
        },
      ),
    );
  }
}
