class PedidoEnvio {
  PedidoEnvio({
    required this.id,
    required this.carritoid,
    required this.tarjetaid,
    required this.departamento,
    required this.ciudad,
    required this.direccionEnvio,
    //required this.estadoEnvio,
    required this.fechaPedido,
    required this.fechaEntrega,
    required this.monto,
    required this.telfCliente,
  });

  final int id;
  final int carritoid;
  final int tarjetaid;
  final String departamento;
  final String ciudad;
  final String direccionEnvio;
  //final String estadoEnvio;
  final DateTime fechaPedido;
  final DateTime fechaEntrega; //estimar hasta 5 dias despues
  final double monto;
  final String telfCliente;

  //esto no manejo bien

  PedidoEnvio.fromJson(Map json) 
    : id = json['id'],
      carritoid = json['carrito_id'],
      tarjetaid = json['tarjeta_id'],
      departamento = json['departamento'],
      ciudad = json['ciudad'],
      direccionEnvio = json['direccionEnvio'],
      //estadoEnvio = json['estado_Envio'],
      fechaPedido = json['fechaPago'],
      fechaEntrega = json['fechaEnvio'],
      monto = json['monto'],
      telfCliente = json['telfCliente'];

  Map toJson() {
    return {
      "id": id,
      "carrito_id": carritoid,
      "tarjeta_id": tarjetaid,
      "departamento": departamento,
      "ciudad": ciudad,
      "direccionEnvio": direccionEnvio,
      //"estado_Envio": estadoEnvio,
      "fechaPago": fechaPedido,
      "fechaEnvio": fechaEntrega,
      "monto": monto,
      "telfCliente": telfCliente,
    };
  }

  factory PedidoEnvio.fromMap(Map<String, dynamic> json) => PedidoEnvio(
        id: json['id'],
        carritoid: json['carrito_id'],
        tarjetaid: json['tarjeta_id'],
        departamento: json['departamento'],
        ciudad: json['ciudad'],
        direccionEnvio: json['direccionEnvio'],
        //estadoEnvio: json['estado_Envio'],
        fechaPedido: json['fechaPago'],
        fechaEntrega: json['fechaEnvio'],
        monto: json['monto'],
        telfCliente: json['telfCliente'],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "carrito_id": carritoid,
        "tarjeta_id": tarjetaid,
        "departamento": departamento,
        "ciudad": ciudad,
        "direccionEnvio": direccionEnvio,
        //"estado_Envio": estadoEnvio,
        "fechaPago": fechaPedido,
        "fechaEnvio": fechaEntrega,
        "monto": monto,
        "telfCliente": telfCliente,
      };
}