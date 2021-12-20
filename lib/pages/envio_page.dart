import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:prueba_agroshop/pages/factura_page.dart';
import 'package:prueba_agroshop/services/envio_services.dart';
import 'package:prueba_agroshop/utils/rounded_button.dart';
import 'package:prueba_agroshop/variables.dart';

// ignore: use_key_in_widget_constructors
class EnvioPage extends StatefulWidget {
  // ignore: prefer_const_declarations
  static final routeName = 'envio';
  @override
  _EnvioPageState createState() => _EnvioPageState();
}

class _EnvioPageState extends State<EnvioPage> {
  String _departamento = '';
  String _ciudad = '';
  String _direccion = '';
  String _tarjeta = '';
  String _fecha = '';
  String _telefono = '';

  createEnvioPressed() async {
    http.Response response =
        await EnvioService.createEnvio(int.parse(_tarjeta), _departamento, _ciudad, _direccion, 
        _fecha, _telefono);
    Map responseMap = jsonDecode(response.body);

    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => const FacturaPage(),
        ));
    /*} else {
        errorSnackBar(context, responseMap.values.first[0]);
      */
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          //ver
          child: Column(
            children: <Widget>[
              Card(
                //av.?
                elevation: 4.0,
                color: Colors.white,
                margin: const EdgeInsets.only(left: 20, right: 20),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(children: [
                    TextFormField(
                      decoration: InputDecoration(labelText: "Tarjeta"),
                      onChanged: (value) {
                        _tarjeta = value;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: "Departamento"),
                      onChanged: (value) {
                        _departamento = value;
                      },
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: "Ciudad"),
                      onChanged: (value) {
                        _ciudad = value;
                      },
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: "Direccion"),
                      onChanged: (value) {
                        _direccion = value;
                      },
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: "Fecha"),
                      onChanged: (value) {
                        _fecha = value;
                      },
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: "Celular"),
                      onChanged: (value) {
                        _telefono = value;
                      },
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    RoundedButton(
                      btnText: 'Generar Factura',
                      onBtnPressed: () => createEnvioPressed(),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    const SizedBox(height: 15)
                  ]),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
