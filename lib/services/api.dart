import 'dart:convert';

import 'package:prueba_agroshop/services/globals.dart';
import 'package:http/http.dart' as http;
import 'package:prueba_agroshop/variables.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CallApi {
  final String _imgUrl='http://10.0.2.2:8000/api/image/';

  getImage(){
    return _imgUrl;
  }

  postData(data, apiUrl) async {
    var fullUrl = baseURL + apiUrl + await _getToken();
    return await http.post(Uri.parse(fullUrl),
        body: jsonEncode(data), headers: _setHeaders());
  }

  getData(apiUrl) async {
    var fullUrl = baseURL + apiUrl + await _getToken();
    return await http.get(Uri.parse(fullUrl), headers: _setHeaders());
  }

  _setHeaders() => {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      };

  _getToken() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var token = localStorage.getString('token');
    return '?token=$token';
  }

  getPublicData(apiUrl) async {
    http.Response response = await http.get(Uri.parse(baseURL + apiUrl));
    try {
      if (response.statusCode == 200) {
        return response;
      } else {
        return 'failed';
      }
    } catch (e) {
      // ignore: avoid_print
      print(e);
      return 'failed';
    }
  }

  getCarrito() async {
    http.Response response = 
    await http.get(Uri.parse('http://10.0.2.2:8000/api/carritos/$idCarritoCliente/productos'));
    try {
      if (response.statusCode == 200) {
        return response;
      } else {
        return 'failed';
      }
    } catch (e) {
      // ignore: avoid_print
      print(e);
      return 'failed';
    }
  }
}
