import 'package:flutter/material.dart';
import 'package:prueba_agroshop/pages/onboarding_page.dart';
import 'package:prueba_agroshop/pages/register_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //return const MaterialApp(
      return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: OnboardingPage.routeName,
      routes: {
        //HomePage.routeName: (_) => HomePage(),
        OnboardingPage.routeName: (_) => OnboardingPage(),
        //LoginPage.routeName: (_) => LoginPage(),
        //RegisterPage.routeName: (_) => RegisterPage(),
      },
      //home: RegisterPage(),
    );
  }
}