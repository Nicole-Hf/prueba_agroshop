import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:prueba_agroshop/model/factura.dart';
import 'package:prueba_agroshop/model/factura_item.dart';
import 'package:prueba_agroshop/services/api.dart';
import 'package:prueba_agroshop/services/pdf_api.dart';
import 'package:prueba_agroshop/services/pdf_factura.dart';
import 'package:prueba_agroshop/variables.dart';

// ignore: use_key_in_widget_constructors
class PdfPage extends StatefulWidget {
  @override
  _PdfPageState createState() => _PdfPageState();
}

class _PdfPageState extends State<PdfPage> {
  late Factura factura;

  @override
  void initState() {
    _getFactura();
    super.initState();
  }

  _getFactura() async {
    await _initData();
  }

  //llamada a las API
  _initData() async {
    await CallApi().getPublicData("factura/$idFactura").then((response) {
      setState(() {
        factura = json.decode(response.body);
        //factura = list.map((model) => Factura.fromJson(model)).toList();
      });
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          // ignore: prefer_const_constructors
          title: Text("Factura"),
          centerTitle: true,
        ),
        body: Container(
          // ignore: prefer_const_constructors
          padding: EdgeInsets.all(32),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(height: 48),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(40)),
                  // ignore: prefer_const_constructors
                  child: FittedBox(
                    child: Text(
                      'Invoice PDF',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                  onPressed: () async {
                    print("error4");
                    final date = DateTime.now();
                    final invoice = Factura(                 
                      fecha: factura.fecha,
                      nit: factura.nit,
                      total: factura.total,
                      /*items: [
                        FacturaItem(
                          nombre: 'Coffee',
                          cantidad: 4,
                          subtotal: 3,
                        ),
                      ],*/
                      id: factura.id,
                      pagoID: factura.pagoID,
                    );
                    //final pdfFile = await PdfInvoiceApi.generate(invoice);
                    //PdfApi.openFile(pdfFile);
                  },
                ),
              ],
            ),
          ),
        ),
      );
}
