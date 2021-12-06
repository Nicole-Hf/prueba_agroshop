class Categoria {

  Categoria({
    required this.id, 
    required this.nombre, 
  });


  final int id;
  final String nombre;
  //late List<Subcategoria> listaSub;

  Categoria.fromJson(Map json)
      : id = json['id'],
        nombre = json['nombre'];

  Map toJson() {
    return {
      'id': id,
      'nombre': nombre,
    };
  }
}
