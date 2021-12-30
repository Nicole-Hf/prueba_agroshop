import 'dart:convert';
import 'package:get/get.dart';

List<ProductoInfo> productFromJson(String str) => 
List<ProductoInfo>.from(json.decode(str).map((x) => ProductoInfo.fromJson(x)));

String productToJson(List<ProductoInfo> data) => 
json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductoInfo {
 
  ProductoInfo({
    required this.id, 
    required this.nombre, 
    required this.descripcion, 
    required this.precio, 
    required this.stock,
    required this.imagen,
    required this.empresa, 
    required this.subcategoria,
    required this.categoria,
    required this.addingWL,
  });


  final int id;
  final String nombre;
  final String descripcion;
  final String precio;
  final int stock;
  final String imagen;
  final int empresa;
  final int subcategoria;
  final int categoria;
  final bool addingWL;

  /*ProductoInfo.fromJson(Map json)
      : id = json['id'],
        nombre = json['nombre'],
        descripcion = json['descripcion'],
        precio = json['precio'],
        imagen = json['imagen'],
        stock = json['stock'],
        empresa = json['empresa_id'],
        subcategoria = json['subcategoria_id'],
        categoria = json['categoria'],
        addingWL = json['addToList'];*/

  /*Map toJson() {
    return {
      'id': id,
      'nombre': nombre,
      'descripcion': descripcion,
      'precio': precio,
      'imagen': imagen,
      'stock': stock,
      'empresa_id': empresa,
      'subcategoria_id': subcategoria,
      'categoria': categoria,
      'addToList': addingWL,
    };
  }*/

  var isFavorite = false.obs;

  factory ProductoInfo.fromJson(Map<String, dynamic> json) => ProductoInfo(
    id: json["id"],
    nombre: json["nombre"],
    descripcion: json["descripcion"],
    precio: json["precio"],
    imagen: json["imagen"],
    stock: json["stock"],
    empresa: json["empresa_id"],
    subcategoria: json["subcategoria_id"],
    categoria: json["categoria"],
    addingWL: json["addToList"]
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "nombre": nombre,
    "descripcion": descripcion,
    "precio": precio,
    "imagen": imagen,
    "stock": stock,
    "empresa_id": empresa,
    "subcategoria_id": subcategoria,
    "categoria": categoria,
    "addToList": addingWL,
  };
}
