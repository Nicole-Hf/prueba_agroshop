// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

Cart CartFromMap(String str) => Cart.fromMap(json.decode(str));
String CartToMap(Cart data) => json.encode(data.toMap());

class Cart {

  Cart({
    required this.id,
    required this.clienteid,
    required this.monto,
    required this.estado,
  });

  final int id;
  final int clienteid;
  final String monto;
  final String estado;

  Cart.fromJson(Map json) 
    : id = json['id'],
      clienteid = json['cliente_id'],
      monto = json['monto'],
      estado = json['estado'];

  Map toJson() {
    return {
      "id": id,
      "cliente_id": clienteid,
      "monto": monto,
      "estado" : estado,      
    };
  }

  factory Cart.fromMap(Map<String, dynamic> json) =>   Cart(
    id: json["id"],
    clienteid: json["cliente_id"],
    monto: json["monto"],
    estado: json["estado"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "cliente_id": clienteid,
    "monto": monto,
    "estado" : estado,
  };
}