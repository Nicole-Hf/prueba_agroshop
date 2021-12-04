import 'dart:convert';

import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flutter/material.dart';
//import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:prueba_agroshop/model/categoria.dart';
import 'package:prueba_agroshop/model/producto.dart';
import 'package:prueba_agroshop/services/api.dart';
import 'package:prueba_agroshop/utils/Theme.dart';
import 'package:prueba_agroshop/utils/text_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProductoPage extends StatefulWidget {
  //const ProductoPage({required Key key}) : super(key: key);
  static const String route = 'catalogo';
  
  @override
  _ProductoPageState createState() => _ProductoPageState();
}

class _ProductoPageState extends State<ProductoPage> {
  var productos = <ProductoInfo>[];
  var categorias = <Categoria>[];
  var filteredProducts = <ProductoInfo>[];
  var listaCarrito = <ProductoInfo>[];
  
  @override
  void initState() {
    _getProductos();
    super.initState();
  }

  _getProductos() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var user = localStorage.getString("user");
    await _initData();
  }

  _initData() async {
    await CallApi().getPublicData("someproducts").then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        productos = filteredProducts = list.map((model) => ProductoInfo.fromJson(model)).toList();
      });
    });

    await CallApi().getPublicData("allcategories").then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        categorias = list.map((model) => Categoria.fromJson(model)).toList();
      });
    });
  }

  void _filterProducts(value) {
    setState(() {
      filteredProducts = productos.where((productos) => productos.categoria == value).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    debugPrint(height.toString());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 30,
        backgroundColor: Color(0xFFfffff),
        elevation: 0.0,
      ),
      body: Column(
        children: [
          Container(
            height: 80,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SearchBar(),
            )
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: height * 0.015),
            height: height * 0.13,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categorias == null ? 0 : categorias.length,
                itemBuilder: (_, c) {
                  return categorias.length == 0 ? CircularProgressIndicator() : 
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: Container(
                      width: width * 0.26,
                      decoration: BoxDecoration(
                        color: Colors.lightGreen.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(10)
                      ),
                      padding: EdgeInsets.all(width * 0.02),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            categorias[c].nombre,
                          )
                        ],
                      ),
                    ),
                  );
                }
              )
          ),
          Container(
            padding: const EdgeInsets.only(left: 20, right: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextWidget(
                  text: "Productos Populares", 
                  fontSize: 25,
                ),
                Row(
                  children: [
                    TextWidget(
                      text: "ver todo", 
                      fontSize: 16, 
                      color: Colors.grey,
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.arrow_forward_ios, 
                        color: Colors.grey, 
                        size: 16),
                      onPressed: (){ } 
                    )
                  ],
                )
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                height: height * 0.4,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: productos == null ? 0 : productos.length,
                  itemBuilder: (_, i) {
                    return GestureDetector(
                      onTap: () {
                        /*Navigator.push(context,
                          MaterialPageRoute(builder: (context) => DetalleProductoPage(ProductoInfo))
                        );*/
                      },
                      child: 
                      productos.length == 0 ? CircularProgressIndicator() : 
                      Container(
                        height: height * 0.4,
                        width: 150,
                        margin: const EdgeInsets.only(left: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Card(
                              semanticContainer: true,
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              child: Image.network(
                                "http://10.0.2.2:8000" + productos[i].imagen.toString(),
                                fit: BoxFit.contain,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              elevation: 5,
                            ),
                            TextWidget(
                              text: productos[i].nombre, 
                              fontSize: 20,
                              color: MaterialColors.black,
                            ),
                            TextWidget(
                              text: "Bs.-" + productos[i].precio, 
                              fontSize: 16, 
                              color: Color(0xFFa9b3bd)
                            )
                          ] 
                        ),
                      )
                    );
                  },
                )
              )
            ),
          )
        ],
      ),
    );
  } 
}