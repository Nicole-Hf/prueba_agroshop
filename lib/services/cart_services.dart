import 'dart:convert';

import 'package:prueba_agroshop/model/carrito.dart';
import 'package:prueba_agroshop/services/globals.dart';
import 'package:http/http.dart' as http;
import 'package:prueba_agroshop/variables.dart';

class CartService {

  Future<CartProduct?> getCart(String cartId) async {
    final url = baseURL + '/cartproduct/' + cartId;
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final datosresponse = cartProductFromMap(response.body);
      return datosresponse;
    }
    return null;
  }

  Future<bool> addProductToCart(int productID) async {
    Map data = {
      "producto_id" : productID,
      "carrito_id" : idCarritoCliente,
    };
    var body = json.encode(data);

    var url = Uri.parse('http://10.0.2.2:8000/api/cartproduct/store');
    http.Response response = await http.post(
      url, 
      headers: headers, 
      body: body
    );

    print(response.body);
    if (response.statusCode == 200 || response.statusCode == 201) {
      print(response.statusCode);
      return true;
    } else {
      print(response.statusCode);
      return false;
    }
  }
}