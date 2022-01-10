class PedidoEnvio {
  PedidoEnvio({
    required this.id,
    required this.carritoid,
    required this.tarjetaid,
    required this.departamento,
    required this.ciudad,
    required this.direccionEnvio,
    required this.fechaPedido,
    required this.fechaEntrega,
    required this.monto,
    required this.telfCliente,
    required this.nit
  });

  final int id;
  final int carritoid;
  final int tarjetaid;
  final String departamento;
  final String ciudad;
  final String direccionEnvio;
  final DateTime fechaPedido;
  final DateTime fechaEntrega; 
  final double monto;
  final String telfCliente;
  final String nit;

  PedidoEnvio.fromJson(Map json) 
    : id = json['id'],
      carritoid = json['carrito_id'],
      tarjetaid = json['tarjeta_id'],
      departamento = json['departamento'],
      ciudad = json['ciudad'],
      direccionEnvio = json['direccionEnvio'],
      fechaPedido = json['fechaPago'],
      fechaEntrega = json['fechaEnvio'],
      monto = json['monto'],
      telfCliente = json['telfCliente'],
      nit = json['nit'];

  Map toJson() {
    return {
      "id": id,
      "carrito_id": carritoid,
      "tarjeta_id": tarjetaid,
      "departamento": departamento,
      "ciudad": ciudad,
      "direccionEnvio": direccionEnvio,
      "fechaPago": fechaPedido,
      "fechaEnvio": fechaEntrega,
      "monto": monto,
      "telfCliente": telfCliente,
      "nit": nit,
    };
  }

  factory PedidoEnvio.fromMap(Map<String, dynamic> json) => PedidoEnvio(
        id: json['id'],
        carritoid: json['carrito_id'],
        tarjetaid: json['tarjeta_id'],
        departamento: json['departamento'],
        ciudad: json['ciudad'],
        direccionEnvio: json['direccionEnvio'],
        fechaPedido: json['fechaPago'],
        fechaEntrega: json['fechaEnvio'],
        monto: json['monto'],
        telfCliente: json['telfCliente'],
        nit: json['nit'],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "carrito_id": carritoid,
        "tarjeta_id": tarjetaid,
        "departamento": departamento,
        "ciudad": ciudad,
        "direccionEnvio": direccionEnvio,
        "fechaPago": fechaPedido,
        "fechaEnvio": fechaEntrega,
        "monto": monto,
        "telfCliente": telfCliente,
        "nit": nit,
      };
}