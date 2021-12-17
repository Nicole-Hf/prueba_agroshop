// ignore_for_file: unnecessary_new, file_names
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prueba_agroshop/model/producto.dart';
import 'package:prueba_agroshop/model/wishlist.dart';
import 'package:prueba_agroshop/services/api.dart';
import 'package:prueba_agroshop/utils/text_widget.dart';

// ignore: use_key_in_widget_constructors
class WishlistPage extends StatefulWidget {
  // ignore: prefer_const_declarations
  static final routeName = 'wishlist';

  @override
  _WishlistPageState createState() => _WishlistPageState();
}

class _WishlistPageState extends State<WishlistPage> {
  var articles = <Wishlist>[];
  var listaCarrito = <ProductoInfo>[];
  var listaDeseos = <ProductoInfo>[];

  @override
  void initState() {
    _getProductos();
    super.initState();
  }

  _getProductos() async {
    await _initData();
  }

  _initData() async {
    await CallApi().getPublicData("wishlist/1").then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        articles = list.map((model) => Wishlist.fromJson(model)).toList();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        elevation: 0,
        title: const Text('AgroShop',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,),
      ),),
      body: Container(
      color: Colors.white,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: height * 0.02,),
            // ignore: prefer_const_constructors
            SizedBox(height: 15,),
            Expanded(
              child: SingleChildScrollView(
                child: articles.isEmpty
                  // ignore: prefer_const_constructors
                  ? CircularProgressIndicator()
                  : Column(
                      children: articles.map((article) {
                        debugPrint(article.imagen.toString());
                        return GestureDetector(
                          onTap: () {
                            /*Navigator.push(context, MaterialPageRoute(
                                builder: (context) => DetailBookPage(
                                articleInfo: article, index: 0)));*/
                          },
                          child: Container(
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            height: 250,
                            child: Stack(
                              children: [
                                Positioned(
                                  top: 35,
                                  child: new Material(
                                    elevation: 0.0,
                                    child: new Container(
                                      height: 180.0,
                                      width: width * 0.9,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(0.0),
                                        boxShadow: [new BoxShadow(
                                          color: Colors.grey.withOpacity(0.3),
                                          // ignore: prefer_const_constructors
                                          offset: new Offset(0.0, 0.0),
                                          blurRadius: 20.0,
                                          spreadRadius: 4.0
                                    )],),
                              ))),
                              Positioned(
                                top: 0,
                                left: 10,
                                child: Card(
                                  elevation: 10.0,
                                  shadowColor: Colors.grey.withOpacity(0.5),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),),
                                  child: Container(
                                    height: 200,
                                    width: 150,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0),
                                        image: DecorationImage(
                                          fit: BoxFit.fill,
                                          image: NetworkImage(
                                            "http://10.0.2.2:8000" + article.imagen.toString(),
                                      ),))
                                ))),
                                Positioned(top: 45, left: width * 0.4,
                                  // ignore: sized_box_for_whitespace
                                  child: Container(
                                    height: 200, width: 150,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        TextWidget(
                                          text: article.nombre,
                                          fontSize: 20,
                                          color: Colors.black,),
                                        SizedBox(height: height * 0.02),
                                        TextWidget(
                                          text: "Bs.-" + article.precio.toString(),
                                          fontSize: 16,
                                          // ignore: prefer_const_constructors
                                          color: Color(0xFFa9b3bd)),
                                        // ignore: prefer_const_constructors
                                        Divider(color: Colors.black),
                                        SizedBox(height: height * 0.02),
                                        Padding(
                                          padding: const EdgeInsets.only(right: 8.0, left: 8.0,),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Align(
                                                alignment: Alignment.bottomRight,
                                                child: GestureDetector(
                                                  child: (
                                                    (!listaDeseos.contains(article))
                                                    ? const Icon(
                                                        Icons.favorite_outline,
                                                        size: 33,
                                                      )
                                                    : const Icon(
                                                        Icons.favorite,
                                                        color: Colors.red,
                                                        size: 33,
                                                      )
                                                    ),
                                                    onTap: () {
                                                      
                                                    },
                                                  ),
                                                ),
                                                Align(
                                                  alignment: Alignment.bottomRight,
                                                  child: GestureDetector(
                                                    child: (
                                                      (!listaCarrito.contains(article))
                                                      ? const Icon(
                                                          Icons.shopping_cart,
                                                          color: Colors.black,
                                                          size: 33,
                                                        )
                                                      : const Icon(
                                                          Icons.shopping_cart,
                                                          color: Colors.green,
                                                          size: 33,
                                                        )
                                                      ),
                                                      onTap: () {
                                                      },
                                              ),)]
                                        ))],
                                  ))),
                            ],)));
                      }
                    ).toList(),
            ),),),],
      )),)
    );
  }
}

