class PedidoEnvio {
  PedidoEnvio({
    required this.id,
    required this.carritoid,
    required this.tarjetaid,
    required this.pais,
    required this.ciudad,
    required this.direccion,
    required this.estadoEnvio,
    required this.fechaPedido,
    required this.fechaEntrega,
    required this.monto,
  });

  final int id;
  final int carritoid;
  final int tarjetaid;
  final String pais;
  final String ciudad;
  final String direccion;
  final String estadoEnvio;
  final DateTime fechaPedido;
  final DateTime fechaEntrega; //estimar hasta 5 dias despues
  final double monto;

  //esto no manejo bien

  PedidoEnvio.fromJson(Map json) 
    : id = json['id'],
      carritoid = json['carrito_id'],
      tarjetaid = json['tarjeta_id'],
      pais = json['pais'],
      ciudad = json['ciudad'],
      direccion = json['direccion'],
      estadoEnvio = json['estado_Envio'],
      fechaPedido = json['fecha_Pedido'],
      fechaEntrega = json['fecha_Entrega'],
      monto = json['monto'];

  Map toJson() {
    return {
      "id": id,
      "carrito_id": carritoid,
      "tarjeta_id": tarjetaid,
      "pais": pais,
      "ciudad": ciudad,
      "direccion": direccion,
      "estado_Envio": estadoEnvio,
      "fecha_Pedido": fechaPedido,
      "fecha_Entrega": fechaEntrega,
      "monto": monto,
    };
  }

  factory PedidoEnvio.fromMap(Map<String, dynamic> json) => PedidoEnvio(
        id: json['id'],
        carritoid: json['carrito_id'],
        tarjetaid: json['tarjeta_id'],
        pais: json['pais'],
        ciudad: json['ciudad'],
        direccion: json['direccion'],
        estadoEnvio: json['estado_Envio'],
        fechaPedido: json['fecha_Pedido'],
        fechaEntrega: json['fecha_Entrega'],
        monto: json['monto'],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "carrito_id": carritoid,
        "tarjeta_id": tarjetaid,
        "pais": pais,
        "ciudad": ciudad,
        "direccion": direccion,
        "estado_Envio": estadoEnvio,
        "fecha_Pedido": fechaPedido,
        "fecha_Entrega": fechaEntrega,
        "monto": monto,
      };
}