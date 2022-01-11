class FacturaComp {
  FacturaComp({
    required this.id,
    required this.fecha,
    required this.nit,
    required this.totalImp,
    required this.pagoid,
    required this.monto,
    required this.productoId,
    required this.nombre,
    required this.cantidad,
    required this.subtotal,
    required this.precio
  });

  final int id;
  final String fecha;
  final String nit;
  final String totalImp;
  final int pagoid;
  final String monto;
  final int productoId;
  final String nombre;
  final int cantidad;
  final double subtotal;
  final double precio;

  FacturaComp.fromJson(Map json) 
    : id = json['id'],
      fecha = json['fecha'],
      nit = json['nit'],
      totalImp = json['totalImpuesto'],
      pagoid = json['pago_id'],
      monto = json['monto'],
      productoId = json['producto_id'],
      nombre = json['nombre'],
      cantidad = json['cantidad'],
      subtotal = json['subtotal'],
      precio = json['precio'];

  Map toJson() {
    return {
      "id": id,
      "fecha": fecha,
      "nit": nit,
      "totalImpuesto": totalImp,
      "pago_id": pagoid,
      "monto": monto,
      "producto_id": productoId,
      "nombre": nombre,
      "cantidad": cantidad,
      "subtotal": subtotal,
      "precio": precio,
    };
  }
}