import 'dart:convert';

import 'package:prueba_agroshop/services/globals.dart';
import 'package:http/http.dart' as http;
import 'package:prueba_agroshop/variables.dart';

class WishlistService {

  Future<bool> addProductToList(int productID) async {
    Map data = {
      "producto_id" : productID,
      "wishlist_id" : idWishlistCliente,
    };
    var body = json.encode(data);

    var url = Uri.parse(baseURL+'wishlist/add');
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