class Tarjeta {
  Tarjeta({
    required this.id,
    required this.nombre,
    required this.numero,
    required this.cvv,
    required this.fecha,
    required this.cliente,
  });

  final int id;
  final String nombre;
  final int numero;
  final int cvv;
  final String fecha;
  final int cliente;

  Tarjeta.fromJson(Map json)
    : id = json['id'],
      nombre = json['nombre'],
      numero = json['numero'],
      cvv = json['cvv'],
      fecha = json['fecha'],
      cliente = json['cliente_id'];
      
  Map toJson() {
    return {
      'id': id,
      'nombre': nombre,
      'numero': numero,
      'cvv': cvv,
      'fecha': fecha,
      'cliente_id': cliente,
    };
  }
}