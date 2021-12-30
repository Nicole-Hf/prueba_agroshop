import 'package:http/http.dart' as http;
import 'package:prueba_agroshop/model/producto.dart';
import 'package:prueba_agroshop/services/globals.dart';
import 'package:prueba_agroshop/variables.dart';

class ProductService {
  static var client = http.Client();

  static Future<List<ProductoInfo>?> fetchProducts() async {
    var response = await client.get(Uri.parse(baseURL+'category/products/$idCategory'));
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return productFromJson(jsonString);
    } else {
      return null;
    }
  }
}