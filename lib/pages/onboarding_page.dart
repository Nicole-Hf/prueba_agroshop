import 'package:flutter/material.dart';
import 'package:prueba_agroshop/pages/register_page.dart';

// ignore: use_key_in_widget_constructors
class OnboardingPage extends StatelessWidget {
  // ignore: prefer_const_declarations
  static final routeName = 'onboarding';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: <Widget>[
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/onboarding.png"),
              fit: BoxFit.cover))),
        Padding(
          padding: 
            const EdgeInsets.only(top: 73, left: 32, right: 32, bottom: 116),
          // ignore: avoid_unnecessary_containers
          child: Container(
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      // ignore: prefer_const_constructors
                      Padding(
                        padding: const EdgeInsets.only(right: 48.0),
                        child: const Text.rich(TextSpan(
                          text: "AgroShop",
                          style: TextStyle(color: Colors.white, fontSize: 60, fontStyle: FontStyle.normal)
                      )),),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: SizedBox(
                      width: double.infinity,
                      height: 60,
                      // ignore: deprecated_member_use
                      child: FlatButton(
                        textColor: Colors.white,
                        color: Colors.green,   
                        onPressed: () {
                          Navigator.push(context,MaterialPageRoute(
                            builder: (BuildContext context) => const RegisterPage(),
                          ));
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.only(
                            left: 8, right: 8, top: 10, bottom: 10),
                          child: Text("Get Started",
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 22.0))),
                  ),),),
                ],
        ),),),)
      ]));
  }
}