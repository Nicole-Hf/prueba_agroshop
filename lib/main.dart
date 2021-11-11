import 'package:flutter/material.dart';
import 'package:prueba_agroshop/pages/home_page.dart';
import 'package:prueba_agroshop/pages/login_page.dart';
import 'package:prueba_agroshop/pages/onboarding_page.dart';
import 'package:prueba_agroshop/pages/register_page.dart';
import 'package:prueba_agroshop/utils/utils.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AgroShop',
      theme: CustomTheme.theme,
      initialRoute: OnboardingPage.routeName,
      routes: {
        HomePage.routeName: (_) => HomePage(),
        OnboardingPage.routeName: (_) => OnboardingPage(),
        LoginPage.routeName: (_) => LoginPage(),
        RegisterPage.routeName: (_) => RegisterPage(),
      },
    );
  }
}


