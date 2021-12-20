class Tarjeta {
  Tarjeta({
    required this.nombre,
    required this.numero,
    required this.cvv,
    required this.fecha,
    required this.cliente,
  });

  String nombre;
  int numero;
  int cvv;
  String fecha;
  int cliente;
}