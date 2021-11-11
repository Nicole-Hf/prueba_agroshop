import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:prueba_agroshop/utils/utils.dart';

class RegisterPage extends StatelessWidget {
  static final routeName = 'register';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: <Widget>[
            //BACKGROUND
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/onboarding-agro.jpg"),
                  fit: BoxFit.cover))),
            //Datos
            Positioned(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Card(
                      elevation: 4.0,
                      color: Colors.white,
                      margin: EdgeInsets.only(left: 20, right: 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            //Name
                            TextField(
                              style: TextStyle(
                                color: Color(0xFF0000000)),
                                //controller: mailController,
                                cursorColor: Color(0xFF9b9b9b),
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.account_circle,
                                    color: Colors.grey,
                                  ),
                                  hintText: "Nombre completo",
                                  hintStyle: TextStyle(
                                    color: Color(0xFF9b9b9b),
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal
                                  ),
                                ),
                            ),
                            //Email
                            TextField(
                              style: TextStyle(
                                color: Color(0xFF0000000)),
                                //controller: mailController,
                                cursorColor: Color(0xFF9b9b9b),
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.mail,
                                    color: Colors.grey,
                                  ),
                                  hintText: "Email",
                                  hintStyle: TextStyle(
                                    color: Color(0xFF9b9b9b),
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal
                                  ),
                                ),
                            ),
                            //Password
                            TextField(
                              style: TextStyle(color: Color(0xFF000000)),
                              cursorColor: Color(0xFF9b9b9b),
                              //controller: passwordController,
                              keyboardType: TextInputType.text,
                              obscureText: true,
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.vpn_key,
                                  color: Colors.grey,
                                ),
                                hintText: "Password",
                                hintStyle: TextStyle(
                                  color: Color(0xFF9b9b9b),
                                  fontSize: 15,
                                  fontWeight: FontWeight.normal),
                                ),
                              ),
                            //Register Button
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: FlatButton(
                                child: Padding(
                                  padding: EdgeInsets.only(top: 8, bottom: 8, left: 10, right:10),
                                  child: Text(
                                    //_isLoading? 'Loging...' : 'Login',
                                    'Crear cuenta',
                                    textDirection: TextDirection.ltr,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15.0,
                                      decoration: TextDecoration.none,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ),
                                color: Color(0xFF4C9900),
                                disabledColor: Colors.grey,
                                shape: new RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(20.0)),
                                onPressed: () {
                                  Navigator.pushReplacementNamed(context, '/');
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

