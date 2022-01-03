import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:prueba_agroshop/pages/factura_page.dart';
import 'package:prueba_agroshop/services/cart_services.dart';
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
  String _fecha = '';
  String _telefono = '';

  createEnvioPressed() async {
    // ignore: unused_local_variable
    http.Response response = await EnvioService.createEnvio(_departamento, _ciudad, _direccion, _fecha, _telefono);
    http.Response responseCart = await CartService.createCart();
    Map responseMap = jsonDecode(responseCart.body);
    var dataCart = json.decode(responseCart.body);
    idCarritoCliente = dataCart['id'];

    Navigator.push(context,
      MaterialPageRoute(builder: (BuildContext context) => const FacturaPage(),));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        elevation: 0,
        title: const Text('Formulario de Envio',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,),),),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(         
          child: Column(
            children: <Widget>[
              Card(
                elevation: 4.0,
                color: Colors.white,
                margin: const EdgeInsets.only(left: 20, right: 20),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(children: [
                    const SizedBox(height: 20,),
                    TextFormField(
                      decoration: const InputDecoration(labelText: "Departamento"),
                      onChanged: (value) {
                        _departamento = value;
                      },
                    ),
                    const SizedBox(height: 30,),
                    TextFormField(
                      decoration: const InputDecoration(labelText: "Ciudad"),
                      onChanged: (value) {
                        _ciudad = value;
                      },
                    ),
                    const SizedBox(height: 30,),
                    TextFormField(
                      decoration: const InputDecoration(labelText: "Direccion"),
                      onChanged: (value) {
                        _direccion = value;
                      },
                    ),
                    const SizedBox(height: 30,),
                    TextFormField(
                      decoration: const InputDecoration(labelText: "Fecha"),
                      onChanged: (value) {
                        _fecha = value;
                      },
                    ),
                    const SizedBox(height: 30,),
                    TextFormField(
                      decoration: const InputDecoration(labelText: "Celular"),
                      onChanged: (value) {
                        _telefono = value;
                      },
                    ),
                    const SizedBox(height: 30,),
                    RoundedButton(
                      btnText: 'Generar Factura',
                      onBtnPressed: () => createEnvioPressed(),
                    ),
                    const SizedBox(height: 40,),
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
