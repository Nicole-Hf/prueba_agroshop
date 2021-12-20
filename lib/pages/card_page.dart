import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:prueba_agroshop/model/tarjeta.dart';
import 'package:prueba_agroshop/pages/envio_page.dart';
import 'package:prueba_agroshop/services/api.dart';
import 'package:prueba_agroshop/utils/text_widget.dart';
import 'package:prueba_agroshop/variables.dart';

class CardPage extends StatefulWidget {
  // ignore: prefer_const_declarations
  static final routeName = 'creditcards';

  @override
  _CardPageState createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  var listcards = <Tarjeta>[];

  @override
  void initState() {
    _getCards();
    super.initState();
  }

  _getCards() async {
    await _initData();
  }

  //llamada a las API
  _initData() async {
    await CallApi().getPublicData("creditcards/$idClienteAutentificado").then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        listcards = list.map((model) => Tarjeta.fromJson(model)).toList();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        elevation: 0,
        title: const Text(
          'AgroShop',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,),),),
      body: Container(
      color: Colors.white,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: height * 0.02,),
            // ignore: prefer_const_constructors
            SizedBox(height: 15,),
            Expanded(
              child: SingleChildScrollView(
                child: listcards.isEmpty
                  // ignore: prefer_const_constructors
                  ? CircularProgressIndicator()
                  : Column(
                      children: listcards.map((listcard) {
                        debugPrint(listcard.nombre);
                        return GestureDetector(
                          onTap: () {
                            idCreditCard = listcard.id;
                            Navigator.push(context, MaterialPageRoute(
                                builder: (context) => EnvioPage()));
                          },
                          child: Container(
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            height: 250,
                            child: Stack(
                              children: [Positioned(
                                top: 35,
                                child: Material(
                                  elevation: 0.0,
                                  child: Container(height: 180.0, width: width * 0.9,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(0.0),
                                      boxShadow: [BoxShadow(
                                        color: Colors.grey.withOpacity(0.3),
                                        // ignore: prefer_const_constructors
                                        offset: Offset(0.0, 0.0),
                                        blurRadius: 20.0,
                                        spreadRadius: 4.0)],),
                              ))),                             
                              Positioned(
                                top: 45,
                                left: width * 0.4,
                                // ignore: sized_box_for_whitespace
                                child: Container(height: 200, width: 150,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      TextWidget(
                                        text: listcard.numero.toString(),
                                        fontSize: 20,
                                        color: Colors.black,),
                                      SizedBox(height: height * 0.02),
                                      TextWidget(
                                        text: listcard.fecha,
                                        fontSize: 16,
                                        // ignore: prefer_const_constructors
                                        color: Color(0xFFa9b3bd)),
                                        // ignore: prefer_const_constructors
                                ],))),
                        ],)));
                      }
                    ).toList(),
              ),),),
      ],)),)
    );
  }
}