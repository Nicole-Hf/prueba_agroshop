import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:prueba_agroshop/services/globals.dart';

class AuthServices {
  static Future<http.Response> register(
      String name, String email, String password) async {
    Map data = {
      "name": name,
      "email": email,
      "password": password,
      "role_id": 2,
    };
    
    var body = json.encode(data);
    //var url = Uri.parse(baseURL + 'auth/register');
    var url = Uri.parse(baseURL + 'register');
    http.Response response = await http.post(
      url,
      headers: headers,
      body: body,
    );
    // ignore: avoid_print
    print(response.body);
    return response;
  }

  static Future<http.Response> login(String email, String password) async {
    Map data = {
      "email": email,
      "password": password,
    };
    var body = json.encode(data);
    //var url = Uri.parse(baseURL + 'auth/login');
    var url = Uri.parse(baseURL + 'login');
    http.Response response = await http.post(
      url,
      headers: headers,
      body: body,
    );
    
    // ignore: avoid_print
    print(response.body);
    return response;
  }
}