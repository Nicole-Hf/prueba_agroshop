import 'dart:convert';

CartProduct cartProductFromMap(String str) => CartProduct.fromMap(json.decode(str));
String cartProductToMap(CartProduct data) => json.encode(data.toMap());

class CartProduct {

  CartProduct({
    required this.id,
    required this.carritoid,
    required this.productoid,
    required this.nombre,
    required this.precio,
    required this.imagen,
    required this.cantidad,
    required this.subtotal
  });

  final int id;
  final int carritoid;
  final int productoid;
  final String nombre;
  final String precio;
  final String imagen;
  late final int cantidad;
  final String subtotal;

  CartProduct.fromJson(Map json) 
    : id = json['id'],
      carritoid = json['carrito_id'],
      productoid = json['producto_id'],
      nombre = json['nombre'],
      precio = json['precio'],
      imagen = json['imagen'],
      cantidad = json['cantidad'],
      subtotal = json['subtotal'];

  Map toJson() {
    return {
      "id": id,
      "carrito_id": carritoid,
      "producto_id": productoid,
      "nombre" : nombre,
      "precio": precio,
      "imagen": imagen,
      "cantidad": cantidad,
      "subtotal": subtotal,
    };
  }

  factory CartProduct.fromMap(Map<String, dynamic> json) =>   CartProduct(
    id: json["id"],
    carritoid: json["carrito_id"],
    productoid: json["producto_id"],
    nombre: json["nombre"],
    precio: json["precio"],
    imagen: json["imagen"],
    cantidad: json["cantidad"],
    subtotal: json["subtotal"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "carrito_id": carritoid,
    "producto_id": productoid,
    "nombre" : nombre,
    "precio": precio,
    "imagen": imagen,
    "cantidad": cantidad,
    "subtotal": subtotal,
  };
}