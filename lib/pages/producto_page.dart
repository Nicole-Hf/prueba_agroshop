import 'dart:convert';

import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flutter/material.dart';
//import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:prueba_agroshop/model/categoria.dart';
import 'package:prueba_agroshop/model/producto.dart';
import 'package:prueba_agroshop/pages/pedido_lista.dart';
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
  var listaDeseos = <ProductoInfo>[];

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
        productos = filteredProducts =
            list.map((model) => ProductoInfo.fromJson(model)).toList();
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
      filteredProducts =
          productos.where((productos) => productos.categoria == value).toList();
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
        //toolbarHeight: 30,
        backgroundColor: Color(0xFFfffff),
        elevation: 0.0,
        //probando
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 16.0, top: 8.0),
            child: GestureDetector(
              child: Stack(
                alignment: Alignment.topCenter,
                children: <Widget>[
                  Icon(Icons.shopping_cart, size: 38, color: Colors.black,),
                  if (listaCarrito.length > 0) 
                    Padding(
                      padding: const EdgeInsets.only(left: 2.0),
                      child: CircleAvatar(
                        radius: 8.0,
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                        child: Text(
                          listaCarrito.length.toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12.0,),
                        ),
                      ),
                    ),
                ],
              ),
              onTap: () {
                if (listaCarrito.isNotEmpty)
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Cart(listaCarrito),
                  ),
                );
              },
            ),
          )
        ],
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
            padding: const EdgeInsets.only(left: 20, right: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextWidget(
                  text: "Categories",
                  fontSize: 25,
                ),
                Row(
                  children: [
                    TextWidget(
                      text: "All Categories",
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.grey, 
                        size: 16
                      ),
                      onPressed: () {}
                    )
                  ],
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: height * 0.015),
            height: height * 0.13,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categorias == null ? 0 : categorias.length,
              itemBuilder: (_, c) {
                return categorias.length == 0
                  ? CircularProgressIndicator()
                  : Padding(
                    padding:
                      const EdgeInsets.symmetric(horizontal: 5.0),
                    child: Container(
                      height: 80,
                      width: width * 0.26,
                      decoration: BoxDecoration(
                        color: Colors.green.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(15),
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
          SizedBox(
            height: height * 0.02,
          ),
          Container(
            padding: const EdgeInsets.only(left: 20, right: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextWidget(
                  text: "Lastest Products",
                  fontSize: 25,
                ),
                Row(
                  children: [
                    TextWidget(
                      text: "View All",
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                    IconButton(
                      icon: const Icon(Icons.arrow_forward_ios,
                        color: Colors.grey, 
                        size: 16
                      ),
                      onPressed: () {}
                    )
                  ],
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              height: height * 0.27,
              child: PageView.builder(
                controller: PageController(viewportFraction: .9),
                itemCount: productos == null ? 0 : productos.length,
                itemBuilder: (_, i) {
                  var item = productos[i];
                  productos[i].cantidad = 0;
                  return GestureDetector(
                    onTap: () {
                      /*Navigator.push(context,
                        MaterialPageRoute(builder: (context) => DetalleProductoPage(ProductoInfo))
                      );*/
                    },
                    child: productos.length == 0
                      ? CircularProgressIndicator()
                      : Stack(
                        children: [
                          Positioned(
                            top: 35,
                            child: new Material(
                              elevation: 0.0,
                              child: new Container(
                                height: 180.0,
                                width: width * 0.85,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(0.0),
                                  boxShadow: [ new BoxShadow(
                                    color: Colors.grey.withOpacity(0.3),
                                    offset: new Offset(-10.0, 0.0),
                                    blurRadius: 20.0,
                                    spreadRadius: 4.0
                                  )]
                                ),
                              ),
                            )
                          ),
                          Positioned(
                            top: 0,
                            left: 10,
                            child: Card(
                              elevation: 10.0,
                              shadowColor: Colors.grey.withOpacity(0.5),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              child: Container(
                                height: 200,
                                width: 150,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: NetworkImage(
                                      "http://10.0.2.2:8000" + productos[i].imagen.toString(),
                                    )
                                  ),
                                )
                              )
                            )
                          ),
                          Positioned(
                            top: 45,
                            left: width * 0.4,
                            child: Container(
                              height: 200,
                              width: 150,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextWidget(
                                    text: productos[i].nombre,
                                    fontSize: 20,
                                    color: MaterialColors.black,
                                  ),
                                  SizedBox(height: height * 0.02),
                                  TextWidget(
                                    text: "Bs.-" + productos[i].precio,
                                    fontSize: 16,
                                    color: Color(0xFFa9b3bd)
                                  ),
                                  Divider(color: Colors.black),
                                  SizedBox(height: height * 0.02),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      right: 8.0,
                                      left: 8.0,
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Align(
                                          alignment: Alignment.bottomRight,
                                          child: GestureDetector(
                                            child: ((!listaDeseos.contains(item))
                                              ? Icon(
                                                  Icons.favorite_outline,
                                                  size: 33,
                                                )
                                              : Icon(
                                                  Icons.favorite,
                                                  color: Colors.red,
                                                  size: 33,
                                                )
                                            ),
                                            onTap: () {
                                              setState(() {
                                                if (!listaDeseos.contains(item))                                                  
                                                  listaDeseos.add(item);                                       
                                                else                                             
                                                  listaDeseos.remove(item);                                                
                                              });
                                            },
                                          ),
                                        ),
                                        Align(
                                          alignment: Alignment.bottomRight,
                                          child: GestureDetector(
                                            child: ((!listaCarrito.contains(item))
                                              ? Icon(
                                                  Icons.shopping_cart,
                                                  color: Colors.black,
                                                  size: 33,
                                                )
                                              : Icon(
                                                  Icons.shopping_cart,
                                                  color: Colors.green,
                                                  size: 33,
                                                )
                                            ),
                                            onTap: () {
                                              setState(() {
                                                if (!listaCarrito.contains(item)) {                                                  
                                                  listaCarrito.add(item);
                                                  productos[i].cantidad++;
                                                }                                                
                                                else {                                                 
                                                  listaCarrito.remove(item);
                                                  productos[i].cantidad--;
                                                }                                               
                                              });
                                            },
                                          ),
                                        )
                                      ]
                                    )
                                  )
                                ],
                              )
                            )
                          ),
                        ],
                      )
                  );
                }
              ),
            )
          )
        ],
      ),
    );
  }
}
