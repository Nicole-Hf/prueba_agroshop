class Subcategoria {

  Subcategoria({
    required this.id, 
    required this.nombre,
    required this.categoria, 
  });


  final int id;
  final String nombre;
  final int categoria;

  Subcategoria.fromJson(Map json)
      : id = json['id'],
        nombre = json['nombre'],
        categoria = json['categoria_id'];

  Map toJson() {
    return {
      'id': id,
      'nombre': nombre,
      'categoria_id': categoria,
    };
  }
}
