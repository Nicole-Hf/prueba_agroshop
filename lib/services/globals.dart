import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//const String baseURL = "https://34.125.80.179/EcommerceAgro/public/api/";
const String baseURL = "http://10.0.2.2:8000/api/"; //emulator localhost
const Map<String, String> headers = {"Content-Type": "application/json"};

errorSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    backgroundColor: Colors.red,
    content: Text(text),
    duration: const Duration(seconds: 1),
  ));
}