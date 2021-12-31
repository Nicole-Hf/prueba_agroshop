import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:prueba_agroshop/model/tarjeta.dart';
import 'package:prueba_agroshop/pages/envio_page.dart';
import 'package:prueba_agroshop/services/api.dart';
import 'package:prueba_agroshop/variables.dart';

// ignore: use_key_in_widget_constructors
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        elevation: 0,
        title: const Text('Forma de Pago',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,),),
      ),
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
                              Navigator.push(context, MaterialPageRoute(builder: (context) => EnvioPage()));
                            },
                            child: Card(
                              elevation: 4.0,
                              color: const Color(0xFF090943),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14),),
                              child: Container(
                                height: 200,
                                padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 22.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    _buildLogosBlock(),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 16.0),
                                      child: Text(listcard.numero.toString(),
                                        style: const TextStyle(color: Colors.white, fontSize: 21, fontFamily: 'CourrierPrime'),),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        _buildDetailsBlock(label: 'CARDHOLDER',value: listcard.nombre,),
                                        _buildDetailsBlock(label: 'VALID THRU', value: listcard.fecha),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            )
                          );
                        }).toList(),
              ),),),
            _buildAddCardButton(icon: Icon(Icons.add), color: Color(0xFF081603),),
            const SizedBox(height: 15,),
      ],)),)
    );
  }

  // Build the top row containing logos
  Row _buildLogosBlock() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Image.asset(
          "assets/images/contact_less.png",
          height: 20,
          width: 18,
        ),
        Image.asset(
          "assets/images/mastercard.png",
          height: 50,
          width: 50,
        ),
      ],
    );
  }

// Build Column containing the cardholder and expiration information
  Column _buildDetailsBlock({required String label, required String value}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          label,
          style: const TextStyle(
              color: Colors.grey, fontSize: 9, fontWeight: FontWeight.bold),
        ),
        Text(
          value,
          style: const TextStyle(
              color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
        )
      ],
    );
  }

  Container _buildAddCardButton({required Icon icon, required Color color,}) {
    return Container(
      margin: const EdgeInsets.only(top: 24.0),
      alignment: Alignment.center,
      child: FloatingActionButton(
        elevation: 2.0,
        onPressed: () {
          print("Add a credit card");
        },
        backgroundColor: color,
        mini: false,
        child: icon,
      ),
    );
  }
}