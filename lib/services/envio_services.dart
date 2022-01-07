import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:prueba_agroshop/services/globals.dart';
import 'package:prueba_agroshop/variables.dart';

class EnvioService {
  static Future<http.Response> createEnvio(String departamento,
      String ciudad, String direccion, String fecha, String telefono) async {
    Map data = {
      "carrito_id": idCarritoCliente,
      "tarjeta_id": idCreditCard,
      "departamento": departamento,
      "ciudad": ciudad,
      "direccionEnvio": direccion,
      "fechaPago": fecha,
      "telfCliente": telefono,
    };
    var body = json.encode(data);

    var url = Uri.parse(baseURL + 'envio/store');
    http.Response response = await http.post(
      url, 
      headers: headers, 
      body: body
    );
    // ignore: avoid_print
    print(response.body);
    return response;
  }

  static Future<http.Response> createFactura() async {
    Map data = {
      "nit": carnet,
      "pago_id": idpago,
    };
    var body = json.encode(data);

    var url = Uri.parse(baseURL + 'factura/store');
    http.Response response = await http.post(
      url, 
      headers: headers, 
      body: body
    );
    // ignore: avoid_print
    print(response.body);
    return response;
  }
}
