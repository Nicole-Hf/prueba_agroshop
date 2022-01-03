import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prueba_agroshop/home_page.dart';
import 'package:prueba_agroshop/pages/login_page.dart';
import 'package:http/http.dart' as http;
import 'package:prueba_agroshop/services/auth_services.dart';
import 'package:prueba_agroshop/services/globals.dart';
import 'package:prueba_agroshop/utils/rounded_button.dart';
import 'package:prueba_agroshop/variables.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String _email = '';
  String _password = '';
  String _name = '';

  createAccountPressed() async {
    bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(_email);
    if (emailValid) {
      http.Response response = await AuthServices.register(_name, _email, _password);
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
        errorSnackBar(context, responseMap.values.first[0]);
      }
    } else {
      errorSnackBar(context, 'email not valid');
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
              padding: const EdgeInsets.all(6.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Card(
                    elevation: 4.0,
                    color: Colors.white,
                    margin: const EdgeInsets.only(left: 20, right: 20),
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
                              hintText: 'Nombre Completo',
                            ),
                            onChanged: (value) {
                              _name = value;
                            },
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          TextField(
                            decoration: const InputDecoration(
                              hintText: 'Email',
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
                              hintText: 'Password',
                            ),
                            onChanged: (value) {
                              _password = value;
                            },
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          RoundedButton(
                            btnText: 'Crear Cuenta',
                            onBtnPressed: () => createAccountPressed(),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        const LoginPage(),
                                  ));
                            },
                            child: const Text(
                              '¿Ya tienes una cuenta?',
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                          const SizedBox(height: 15)
                        ],
                      ),
                    ),
                  )
                ],
              )))
    ]));
  }
}
