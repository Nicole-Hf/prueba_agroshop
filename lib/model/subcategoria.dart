class Subcategoria {

  Subcategoria({
    required this.id, 
    required this.nombre,
    required this.categoria_id, 
  });


  final int id;
  final String nombre;
  final int categoria_id;

  Subcategoria.fromJson(Map json)
      : id = json['id'],
        nombre = json['nombre'],
        categoria_id = json['categoria_id'];

  Map toJson() {
    return {
      'id': id,
      'nombre': nombre,
      'categoria_id': categoria_id,
    };
  }
}
