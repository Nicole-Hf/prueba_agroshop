import 'dart:convert';

import 'package:prueba_agroshop/services/globals.dart';
import 'package:http/http.dart' as http;
import 'package:prueba_agroshop/variables.dart';

class CartService {

  Future<bool> addProductToCart(int productID) async {
    Map data = {
      "producto_id" : productID,
      "carrito_id" : idCarritoCliente,
    };
    var body = json.encode(data);

    var url = Uri.parse(baseURL+'cartproduct/store');
    http.Response response = await http.post(
      url, 
      headers: headers, 
      body: body
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> removeProductToCart(int productID) async {
    Map data = {
      "producto_id" : productID,
      "carrito_id" : idCarritoCliente,
    };
    var body = json.encode(data);

    var url = Uri.parse(baseURL+'cartproduct/remove');
    http.Response response = await http.post(
      url,
      headers: headers,
      body: body
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }

  deleteProductToCart(int productID) async {
    Map data = {
      "producto_id" : productID,
      "carrito_id" : idCarritoCliente,
    };
    var body = json.encode(data);

    var url = Uri.parse(baseURL+'cartproduct/destroy');
    http.Response response = await http.post(
      url,
      headers: headers,
      body: body
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }
}