import 'dart:convert';

import 'package:prueba_agroshop/model/cart_item.dart';
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

  Future<CartProduct> getCartItems() async {
    var url = Uri.parse(baseURL+'cartproduct/$idClienteAutentificado');
    http.Response response = await http.get(url, headers:headers);
    switch (response.statusCode) {
      case 200:
        var body = jsonDecode(response.body);
        return CartProduct.fromJson(body);
      // ignore: dead_code
      break;
      default:
        throw ResourceNotFound('CartProduct');
      // ignore: dead_code
      break;
    }
  }

  static Future<http.Response> createCart() async {
    Map data = {
      "cliente_id": idClienteAutentificado,
      "monto": null,
      "estado": null,
    };
    var body = json.encode(data);

    var url = Uri.parse(baseURL + 'create/cart');
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

class ResourceNotFound implements Exception{
  String messag;
  ResourceNotFound(this.messag);

  @override
  String toString(){
    return "Resource $messag Not Fount" ;
  }
}