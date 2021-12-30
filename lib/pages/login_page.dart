import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:prueba_agroshop/home_page.dart';
import 'package:prueba_agroshop/services/auth_services.dart';
import 'package:prueba_agroshop/services/globals.dart';
import 'package:prueba_agroshop/utils/rounded_button.dart';
import 'package:prueba_agroshop/variables.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _email = '';
  String _password = '';

  loginPressed() async {
    if (_email.isNotEmpty && _password.isNotEmpty) {
      http.Response response = await AuthServices.login(_email, _password);
      Map responseMap = jsonDecode(response.body);
      var dataUser = json.decode(response.body);
      if (response.statusCode == 200) {
        idUserAutentificado = dataUser['id'];
        nameUserAutentificado = dataUser['name'];
        idClienteAutentificado = dataUser['cliente'];
        idCarritoCliente = dataUser['carrito'];
        idWishlistCliente = dataUser['wishlist'];
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => const HomePage(),
            ));
      } else {
        errorSnackBar(context, responseMap.values.first);
      }
    } else {
      errorSnackBar(context, 'Enter all required fields');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: <Widget>[
      Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/onboarding.png"),
                  fit: BoxFit.cover))),
      Positioned(
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Card(
                      elevation: 4.0,
                      color: Colors.white,
                      margin: const EdgeInsets.only(left: 40, right: 40),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            TextField(
                              decoration: const InputDecoration(
                                hintText: 'Ingresa tu email',
                              ),
                              onChanged: (value) {
                                _email = value;
                              },
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            TextField(
                              obscureText: true,
                              decoration: const InputDecoration(
                                hintText: 'Ingresa tu contraseña',
                              ),
                              onChanged: (value) {
                                _password = value;
                              },
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            RoundedButton(
                              btnText: 'LOG IN',
                              onBtnPressed: () => loginPressed(),
                            ),
                            const SizedBox(height: 18)
                          ],
                      ),))
                ],
              )))
    ]));
  }
}
