import 'dart:convert';

CartProduct cartProductFromMap(String str) => CartProduct.fromMap(json.decode(str));
String cartProductToMap(CartProduct data) => json.encode(data.toMap());

class CartProduct {

  CartProduct({
    required this.id,
    required this.carritoid,
    required this.productoid,
    required this.cantidad,
    required this.subtotal,
  });

  final int id;
  final int carritoid;
  final int productoid;
  late final int cantidad;
  final String subtotal;

  factory CartProduct.fromMap(Map<String, dynamic> json) =>   CartProduct(
    id: json['id'],
    carritoid: json['carrito_id'],
    productoid: json['producto_id'],
    cantidad: json['cantidad'],
    subtotal: json['subtotal'],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "carrito_id": carritoid,
    "producto_id": productoid,
    "cantidad": cantidad,
    "subtotal": subtotal,
  };
}