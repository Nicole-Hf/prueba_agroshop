import 'dart:ffi';

class ProductoInfo {

  ProductoInfo({
    required this.id, 
    required this.nombre, 
    required this.descripcion, 
    required this.precio, 
    required this.stock,
    required this.imagen,
    required this.empresa_id, 
    required this.subcategoria_id
  });


  final int id;
  final String nombre;
  final String descripcion;
  final String precio;
  final int stock;
  final String imagen;
  final int empresa_id;
  final int subcategoria_id;

  ProductoInfo.fromJson(Map json)
      : id = json['id'],
        nombre = json['nombre'],
        descripcion = json['descripcion'],
        precio = json['precio'],
        imagen = json['imagen'],
        stock = json['stock'],
        empresa_id = json['empresa_id'],
        subcategoria_id = json['subcategoria_id'];

  Map toJson() {
    return {
      'id': id,
      'nombre': nombre,
      'descripcion': descripcion,
      'precio': precio,
      'imagen': imagen,
      'stock': stock,
      'empresa_id': empresa_id,
      'subcategoria_id': subcategoria_id,
    };
  }
}
