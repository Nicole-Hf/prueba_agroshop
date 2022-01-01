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
    //required this.cantidad
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
  //late int cantidad = 0;

  ProductoInfo.fromJson(Map json)
      : id = json['id'],
        nombre = json['nombre'],
        descripcion = json['descripcion'],
        precio = json['precio'],
        imagen = json['imagen'],
        stock = json['stock'],
        empresa = json['empresa_id'],
        subcategoria = json['subcategoria_id'],
        categoria = json['categoria'];
  //cantidad = json['cantidad'];

  Map toJson() {
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
      //'cantidad': cantidad,
    };
  }
}
