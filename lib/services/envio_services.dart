import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:prueba_agroshop/services/globals.dart';
import 'package:prueba_agroshop/variables.dart';

class EnvioService {
  static Future<http.Response> createEnvio(int tarjeta, String pais,
      String ciudad, String direccion, String fecha) async {
    Map data = {
      "carrito_id": idCarritoCliente,
      "tarjeta_id": tarjeta,
      "pais": pais,
      "ciudad": ciudad,
      "direccion": direccion,
      "fecha_Pedido": fecha,
    };
    var body = json.encode(data);

    var url = Uri.parse(baseURL + 'envio/store');
    http.Response response = await http.post(url, headers: headers, body: body);
    print(response.body);
    return response;
  }
}
