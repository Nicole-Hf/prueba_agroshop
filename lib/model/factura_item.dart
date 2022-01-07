class FacturaItem{
  FacturaItem({
    required this.nombre,
    required this.cantidad,
    required this.subtotal,
  });

  final String nombre;
  final int cantidad;
  final double subtotal;

  factory FacturaItem.fromMap(Map<String, dynamic> json) => FacturaItem(
    nombre: json["nombre"],
    cantidad: json["cantidad"],
    subtotal: json["subtotal"],
  );

  Map<String, dynamic> toMap() => {
    "nombre": nombre,
    "cantidad": cantidad,
    "subtotal": subtotal,
  };
}