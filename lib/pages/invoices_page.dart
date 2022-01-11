// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:prueba_agroshop/model/factura_comp.dart';
import 'package:prueba_agroshop/services/api.dart';
import 'package:prueba_agroshop/variables.dart';

// ignore: use_key_in_widget_constructors
class InvoicePage extends StatefulWidget {
  // ignore: prefer_const_declarations
  static final routeName = "pedidos";

  @override
  _InvoicePageState createState() => _InvoicePageState();
}

class _InvoicePageState extends State<InvoicePage> {
  var facturas = <FacturaComp>[];

  @override
  void initState() {
    _getFacturas();
    super.initState();
  }

  _getFacturas() async {
    await _initData();
  }

  _initData() async {
    await CallApi().getPublicData("factura/$idClienteAutentificado").then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        facturas = list.map((model) => FacturaComp.fromJson(model)).toList();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: const Text('Invoice Page'),),
      body: Container(
        color: Colors.white,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: height * 0.02,),          
              SizedBox(height: 15,),
              Expanded(
                child: SingleChildScrollView(
                child: facturas.isEmpty               
                  ? Center(child: CircularProgressIndicator())
                  : SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: SingleChildScrollView(
                        child: DataTable(
                          columns: [                         
                            DataColumn(label: Text('Nro. Fact')),
                            DataColumn(label: Text('Fecha')),
                            DataColumn(label: Text('Monto')),
                            DataColumn(label: Text('Acción')),
                          ],
                          rows: facturas.map((data) => DataRow(
                            cells: [                          
                              DataCell(Text(data.id.toString())),
                              DataCell(Text(data.fecha.toString())),
                              DataCell(Text(data.monto.toString())),
                              DataCell(IconButton(onPressed: () {}, icon: Icon(Icons.document_scanner))),
                          ])).toList(),
                        ),
                      ),
                    )),
                ),
            ]))));
  }
}