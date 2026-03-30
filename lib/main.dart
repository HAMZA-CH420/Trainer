import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trainer/Features/OnboardingScreens/splashScreen/splash_screen.dart';
import 'package:trainer/viewModel/Providers/AuthenticationProviders/sign_up_provider.dart';
import 'package:trainer/viewModel/Providers/DataBaseProvider/db_provider.dart';

void main() async {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => SignUpProvider()),
        ChangeNotifierProvider(create: (context) => DbProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
      ),
      home: SplashScreen(),
    );
  }
}
