import 'dart:io';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/widgets.dart';
import 'package:prueba_agroshop/model/factura.dart';
import 'package:prueba_agroshop/model/factura_comp.dart';
import 'package:prueba_agroshop/services/pdf_api.dart';
import 'package:prueba_agroshop/variables.dart';

class PdfInvoiceApi {
  static Future<File> generate(Factura invoice) async {
    final pdf = Document();

    pdf.addPage(MultiPage(
      build: (context) => [
        buildHeader(invoice),
        SizedBox(height: 3 * PdfPageFormat.cm),
        buildTitle(),
        buildInvoice(invoice),
        Divider(),
        buildTotal(invoice),
      ],
    ));

    return PdfApi.saveDocument(name: 'factura-$idFactura.pdf', pdf: pdf);
  }

  static Widget buildHeader(Factura invoice) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    SizedBox(height: 1 * PdfPageFormat.cm),
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 50,
          width: 50,
          child: BarcodeWidget(
            barcode: Barcode.qrCode(),
            data: invoice.id.toString(),
          ),
        ),
      ],
    ),
    SizedBox(height: 1 * PdfPageFormat.cm),
    Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        buildCustomerAddress(invoice),
        buildInvoiceInfo(invoice),
      ],
    ),],
  );

  static Widget buildCustomerAddress(Factura invoice) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(nameUserAutentificado, style: TextStyle(fontWeight: FontWeight.bold)),
          Text(invoice.nit, style: TextStyle(fontWeight: FontWeight.bold)),
        ],
      );

  static Widget buildInvoiceInfo(Factura info) {
    final titles = <String>[
      'Invoice Number: ',
      'Invoice Date: ',
    ];
    final data = <String>[
      info.id.toString(),
      info.fecha.toString(),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(titles.length, (index) {
        final title = titles[index];
        final value = data[index];

        return buildText(title: title, value: value, width: 200);
      }),
    );
  }

  static Widget buildTitle() => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text('Agroshop', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
      SizedBox(height: 0.8 * PdfPageFormat.cm),
    ],
  );
  
  static Widget buildInvoice(Factura invoice) {
    final headers = [
      'nombre',
      'cantidad',
      'subtotal',
    ];

    final data = invoice.items.map((item) {
      return [
        item.nombre,
        '${item.cantidad}',
        '\$ ${item.subtotal}',
      ];
    }).toList();

    return Table.fromTextArray(
      headers: headers,
      data: data,
      border: null,
      headerStyle: TextStyle(fontWeight: FontWeight.bold),
      // ignore: prefer_const_constructors
      headerDecoration: BoxDecoration(color: PdfColors.grey300),
      cellHeight: 30,
      cellAlignments: {
        0: Alignment.centerLeft,
        1: Alignment.centerRight,
        2: Alignment.centerRight,
        3: Alignment.centerRight,
      },
    );
  }

  static Widget buildTotal(Factura invoice) {
    return Container(
      alignment: Alignment.centerRight,
      child: Row(
        children: [
          Spacer(flex: 6),
          Expanded(
            flex: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildText(
                  title: 'Total amount due',
                  titleStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                  value: invoice.total.toString(),
                  unite: true,
                ),
                SizedBox(height: 2 * PdfPageFormat.mm),
                Container(height: 1, color: PdfColors.grey400),
                SizedBox(height: 0.5 * PdfPageFormat.mm),
                Container(height: 1, color: PdfColors.grey400),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static buildSimpleText({
    required String title,
    required String value,
  }) {
    final style = TextStyle(fontWeight: FontWeight.bold);

    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: pw.CrossAxisAlignment.end,
      children: [
        Text(title, style: style),
        SizedBox(width: 2 * PdfPageFormat.mm),
        Text(value),
      ],
    );
  }

  static buildText({
    required String title,
    required String value,
    double width = double.infinity,
    TextStyle? titleStyle,
    bool unite = false,
  }) {
    final style = titleStyle ?? TextStyle(fontWeight: FontWeight.bold);

    return Container(
      width: width,
      child: Row(
        children: [
          Expanded(child: Text(title, style: style)),
          Text(value, style: unite ? style : null),
        ],
      ),
    );
  }
}