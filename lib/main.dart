import 'package:flutter/material.dart';
import 'package:prueba_agroshop/pages/home_page.dart';
import 'package:prueba_agroshop/pages/login_page.dart';
import 'package:prueba_agroshop/pages/onboarding_page.dart';
import 'package:prueba_agroshop/pages/pedido_lista.dart';
import 'package:prueba_agroshop/pages/producto_page.dart';
import 'package:prueba_agroshop/pages/register_page.dart';
import 'package:prueba_agroshop/pages/wishlist_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: OnboardingPage.routeName,
      //aquí llamamos a las rutas
      routes: {
        OnboardingPage.routeName: (_) => OnboardingPage(),
        'login': (context) => const LoginPage(),
        'register': (context) => const RegisterPage(),
        'home': (context) => const HomePage(),
        ProductoPage.routeName: (_) => ProductoPage(),
        CartPage.routeName: (_) => CartPage(),
        WishlistPage.routeName: (_) => WishlistPage(),
      },
    );
  }
}