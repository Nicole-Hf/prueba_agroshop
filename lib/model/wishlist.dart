import 'dart:convert';

Wishlist wishlistFromMap(String str) => Wishlist.fromMap(json.decode(str));
String wishlistToMap(Wishlist data) => json.encode(data.toMap());

class Wishlist {

  Wishlist({
    required this.id,
    required this.wishlistid,
    required this.productoid,
    required this.nombre,
    required this.precio,
    required this.imagen
  });

  final int id;
  final int wishlistid;
  final int productoid;
  final String nombre;
  final String precio;
  final String imagen;

  Wishlist.fromJson(Map json) 
    : id = json['id'],
      wishlistid = json['carrito_id'],
      productoid = json['producto_id'],
      nombre = json['nombre'],
      precio = json['precio'],
      imagen = json['imagen'];

  Map toJson() {
    return {
      "id": id,
      "carrito_id": wishlistid,
      "producto_id": productoid,
      "nombre" : nombre,
      "precio": precio,
      "imagen": imagen,
    };
  }

  factory Wishlist.fromMap(Map<String, dynamic> json) =>   Wishlist(
    id: json["id"],
    wishlistid: json["carrito_id"],
    productoid: json["producto_id"],
    nombre: json["nombre"],
    precio: json["precio"],
    imagen: json["imagen"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "carrito_id": wishlistid,
    "producto_id": productoid,
    "nombre" : nombre,
    "precio": precio,
    "imagen": imagen,
  };
}