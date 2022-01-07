import 'package:prueba_agroshop/model/factura_item.dart';

class Factura {
  Factura({
    required this.id,
    required this.nroFactura,
    required this.total,
    required this.nit,
    required this.codControl,
    required this.pagoID,
    required this.fecha,  
    required this.items,
  });

  final int id;
  final int nroFactura;
  final int total;
  final String nit;
  final String codControl;
  final String pagoID;
  final DateTime fecha;
  final List<FacturaItem> items;

  Factura.fromJson(Map json) 
    : id = json['id'],
      nroFactura = json['carrito_id'],
      total = json['tarjeta_id'],
      nit = json['nit'],
      codControl = json['codControl'],
      pagoID = json['pagoID'],
      fecha = json['fechaPago'],
      items = List<FacturaItem>.from(json['items'].map((x) => FacturaItem.fromMap(x)));

  Map toJson() {
    return {
      "id": id,
      "carrito_id": nroFactura,
      "tarjeta_id": total,
      "nit": nit,
      "codControl": codControl,
      "pagoID": pagoID,
      "fechaPago": fecha,
      "items" : List<dynamic>.from(items.map((x) => x.toMap())),
    };
  }

  factory Factura.fromMap(Map<String, dynamic> json) => Factura(
        id: json['id'],
        nroFactura: json['carrito_id'],
        total: json['tarjeta_id'],
        nit: json['nit'],
        codControl: json['codControl'],
        pagoID: json['pagoID'],
        fecha: json['fechaPago'],
        items : List<FacturaItem>.from(json['items'].map((x) => FacturaItem.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "carrito_id": nroFactura,
        "tarjeta_id": total,
        "nit": nit,
        "codControl": codControl,
        "pagoID": pagoID,
        "fechaPago": fecha,
        "items" : List<dynamic>.from(items.map((x) => x.toMap())),
      };
}