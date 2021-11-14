import 'package:flutter/material.dart';
import 'package:prueba_agroshop/pages/register_page.dart';
import 'package:prueba_agroshop/utils/utils.dart';

class OnboardingPage extends StatelessWidget {
  static final routeName = 'onboarding';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: <Widget>[
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/onboarding.png"),
              fit: BoxFit.cover))),
        Padding(
          padding: 
            const EdgeInsets.only(top: 73, left: 32, right: 32, bottom: 116),
          child: Container(
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 48.0),
                        child: Text.rich(TextSpan(
                          text: "AgroShop",
                          style: TextStyle(color: Colors.white, fontSize: 60, fontStyle: FontStyle.normal)
                        )),
                      ),
                    ],
                  ),
                  //Button Login
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: SizedBox(
                      width: double.infinity,
                      height: 60,
                      child: FlatButton(
                        textColor: Colors.white,
                        color: Colors.green,   
                        onPressed: () {
                          Navigator.push(context,MaterialPageRoute(
                            builder: (BuildContext context) => const RegisterPage(),
                          ));
                          //Navigator.pushReplacementNamed(context, 'login');
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: 8, right: 8, top: 10, bottom: 10),
                          child: Text("Get Started",
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 22.0))),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ]));
  }
}