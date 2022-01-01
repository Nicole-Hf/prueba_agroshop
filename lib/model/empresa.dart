class Empresa {
  Empresa({
    required this.id,
    required this.nombre,
    required this.perfil,
    required this.nit,
    // ignore: non_constant_identifier_names
    required this.tipo_negocio,
    // ignore: non_constant_identifier_names
    required this.user_id,
  });

  final int id;
  final String nombre;
  final String perfil;
  final String nit;
  // ignore: non_constant_identifier_names
  final String tipo_negocio;
  // ignore: non_constant_identifier_names
  final int user_id;
  //late List<Subcategoria> listaSub;

  Empresa.fromJson(Map json)
      : id = json['id'],
        nombre = json['nombre'],
        perfil = json['perfil'],
        nit = json['nit'],
        tipo_negocio = json['tipo_negocio'],
        user_id = json['user_id'];

  Map toJson() {
    return {
      'id': id,
      'nombre': nombre,
      'perfil': perfil,
      'nit': nit,
      'tipo_negocio': tipo_negocio,
      'user_id': user_id,
    };
  }
}
