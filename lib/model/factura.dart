// ignore: unused_import
import 'package:prueba_agroshop/model/factura_item.dart';

class Factura {
  Factura({
    required this.id,
    required this.total,
    required this.nit,
    required this.pagoID,
    required this.fecha,  
    //required this.items,
  });

  final int id;
  final int total;
  final String nit;
  final String pagoID;
  final DateTime fecha;
  //final List<FacturaItem> items;

  Factura.fromJson(Map json) 
    : id = json['id'],
      total = json['totalImpuesto'],
      nit = json['nit'],
      pagoID = json['pago_id'],
      fecha = json['fecha'];
      //items = List<FacturaItem>.from(json['items'].map((x) => FacturaItem.fromMap(x)));

  Map toJson() {
    return {
      "id": id,
      "totalImpuesto": total,
      "nit": nit,
      "pago_id": pagoID,
      "fecha": fecha,
      //"items" : List<dynamic>.from(items.map((x) => x.toMap())),
    };
  }

  factory Factura.fromMap(Map<String, dynamic> json) => Factura(
        id: json['id'],
        total: json['totalImpuesto'],
        nit: json['nit'],
        pagoID: json['pago_id'],
        fecha: json['fecha'],
        //items : List<FacturaItem>.from(json['items'].map((x) => FacturaItem.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "totalImpuesto": total,
        "nit": nit,
        "pago_id": pagoID,
        "fecha": fecha,
        //"items" : List<dynamic>.from(items.map((x) => x.toMap())),
      };
}