// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:prueba_agroshop/home_page.dart';
import 'package:prueba_agroshop/pages/pdf_page.dart';
import 'package:prueba_agroshop/services/cart_services.dart';
import 'package:prueba_agroshop/services/envio_services.dart';
import 'package:prueba_agroshop/utils/rounded_button.dart';
import 'package:prueba_agroshop/variables.dart';

// ignore: use_key_in_widget_constructors
class PedidoPage extends StatefulWidget {
  // ignore: prefer_const_declarations
  static final routeName = 'envio';
  @override
  _PedidoPageState createState() => _PedidoPageState();
}

class _PedidoPageState extends State<PedidoPage> {
  String _departamento = '';
  String _ciudad = '';
  String _direccion = '';
  String _fecha = '';
  String _telefono = '';
  String _nit = '';
  final _formKey = GlobalKey<FormState>();

  createEnvioPressed() async {
    // ignore: unused_local_variable
    http.Response response = await EnvioService.createEnvio(_departamento, _ciudad, _direccion, _fecha, _telefono, _nit);
    http.Response responseCart = await CartService.createCart();
    var dataEnvio = json.decode(response.body);
    idpago = dataEnvio['id'];
    print(idpago);
    var dataCart = json.decode(responseCart.body);
    idCarritoCliente = dataCart['id'];
    print(idCarritoCliente);
    
    Navigator.push(context,
      MaterialPageRoute(builder: (BuildContext context) => const HomePage(),));
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
      body: ListView(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(10.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                const SizedBox(height: 30,),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: "Departamento", 
                    icon: Icon(Icons.map)),
                  onChanged: (value) {
                    _departamento = value;
                  },
                ),
                const SizedBox(height: 30,),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: "Ciudad", 
                    icon: Icon(Icons.location_city)),
                  onChanged: (value) {
                    _ciudad = value;
                  },
                ),
                const SizedBox(height: 30,),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: "Direccion",
                    icon: Icon(Icons.maps_ugc)),
                  onChanged: (value) {
                    _direccion = value;
                  },
                ),
                const SizedBox(height: 30,),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: "Fecha", icon: Icon(Icons.calendar_today)),
                  onChanged: (value) {
                    _fecha = value;
                  },
                ),
                const SizedBox(height: 30,),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: "Celular", icon: Icon(Icons.call)),
                  onChanged: (value) {
                    _telefono = value;
                  },
                ),
                const SizedBox(height: 30,),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: "NIT/CI", icon: Icon(Icons.card_membership)),
                  onChanged: (value) {
                    _nit = value;
                  },
                ),
                const SizedBox(height: 30,),
                RoundedButton(
                  btnText: 'Completar Pedido',
                  onBtnPressed: () => createEnvioPressed(),
                ),
                const SizedBox(height: 40,),
                const SizedBox(height: 15)
              ],
            ),
          ),
        ),
      ],
    ));
  }
}
