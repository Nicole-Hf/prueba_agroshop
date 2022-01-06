import 'dart:convert';

// ignore: import_of_legacy_library_into_null_safe
import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:prueba_agroshop/model/categoria.dart';
import 'package:prueba_agroshop/model/producto.dart';
import 'package:prueba_agroshop/pages/allProducts_page.dart';
import 'package:prueba_agroshop/pages/filterProduct_page.dart';
import 'package:prueba_agroshop/services/api.dart';
import 'package:prueba_agroshop/services/cart_services.dart';
import 'package:prueba_agroshop/services/wish_services.dart';
import 'package:prueba_agroshop/utils/text_widget.dart';
import 'package:prueba_agroshop/variables.dart';

// ignore: use_key_in_widget_constructors
class ProductoPage extends StatefulWidget {
  // ignore: prefer_const_declarations
  static final routeName = 'producto';

  @override
  _ProductoPageState createState() => _ProductoPageState();
}

class _ProductoPageState extends State<ProductoPage> {
  //creamos las variables donde se guardaran los datos
  var productos = <ProductoInfo>[];
  var categorias = <Categoria>[];
  
  CartService cartApi = CartService();
  bool _addingToCart = false;

  WishlistService wishApi = WishlistService();

  @override
  void initState() {
    _getProductos();
    super.initState();
  }

  _getProductos() async {
    await _initData();
  }

  //llamada a las API
  _initData() async {
    await CallApi().getPublicData("someproducts/$idWishlistCliente").then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        productos = list.map((model) => ProductoInfo.fromJson(model)).toList();
      });
    });

    await CallApi().getPublicData("allcategories").then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        categorias = list.map((model) => Categoria.fromJson(model)).toList();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    debugPrint(height.toString());
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // ignore: prefer_const_constructors
          SizedBox(height: 8,),
          // ignore: sized_box_for_whitespace
          Container(
            height: 80,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              // ignore: missing_required_param
              child: SearchBar(),
          )),
          Container(
            padding: EdgeInsets.symmetric(vertical: height * 0.015),
            height: height * 0.10,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              // ignore: unnecessary_null_comparison
              itemCount: categorias == null ? 0 : categorias.length,
              itemBuilder: (_, c) {
                return GestureDetector(
                  onTap: () {
                    idCategory = categorias[c].id;
                    category = categorias[c].nombre;
                    Navigator.push(context,
                      MaterialPageRoute(builder: (context) => FilterPage()));
                  },
                  child: categorias.isEmpty
                  // ignore: prefer_const_constructors
                  ? CircularProgressIndicator()
                  : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: Container(
                      height: 80,
                      width: width * 0.30,
                      decoration: BoxDecoration(
                        color: Colors.green.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(20),),
                      // ignore: prefer_const_constructors
                      padding: EdgeInsets.symmetric(vertical: 2.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(categorias[c].nombre,)
                        ],
                  ),),)
                );
              }
          )),
          SizedBox(height: height * 0.02,),
          Container(
            padding: const EdgeInsets.only(left: 20, right: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextWidget(text: "Últimos Productos", fontSize: 25,),
                Row(
                  children: [
                    TextWidget(text: "Ver Todo", fontSize: 16, color: Colors.grey,),
                    IconButton(
                      icon: const Icon(Icons.arrow_forward_ios,
                        color: Colors.grey, 
                        size: 16),
                      onPressed: () {
                        Navigator.push(context,MaterialPageRoute(
                            builder: (BuildContext context) => AllProductsPage(),));
                      }
                    )
                ],)
          ],),),
          Expanded(
            // ignore: sized_box_for_whitespace
            child: Container(
              height: height * 0.27,
              child: PageView.builder(
                controller: PageController(viewportFraction: .9),
                // ignore: unnecessary_null_comparison
                itemCount: productos == null ? 0 : productos.length,
                itemBuilder: (_, i) {
                  return GestureDetector(
                    onTap: () {
                      /*Navigator.push(context,
                        MaterialPageRoute(builder: (context) => DetalleProductoPage(ProductoInfo))
                      );*/
                    },
                    child: productos.isEmpty
                      // ignore: prefer_const_constructors
                      ? CircularProgressIndicator()
                      : Stack(
                        children: [
                          Positioned(
                            top: 35,
                            // ignore: unnecessary_new
                            child: new Material(
                              elevation: 0.0,
                              // ignore: unnecessary_new
                              child: new Container(
                                height: 180.0,
                                width: width * 0.85,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(0.0),
                                  // ignore: unnecessary_new
                                  boxShadow: [ new BoxShadow(
                                    color: Colors.grey.withOpacity(0.3),
                                    // ignore: prefer_const_constructors, unnecessary_new
                                    offset: new Offset(-10.0, 0.0),
                                    blurRadius: 20.0,
                                    spreadRadius: 4.0
                                )]),
                          ),)),
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
                                      "http://10.0.2.2:8000" + productos[i].imagen.toString(),)
                          ),)))),
                          Positioned(
                            top: 45,
                            left: width * 0.4,
                            child: SizedBox(
                              height: 200,
                              width: 150,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextWidget(
                                    text: productos[i].nombre,
                                    fontSize: 20,
                                    color: Colors.black,),
                                  SizedBox(height: height * 0.02),
                                  TextWidget(
                                    text: "Bs.-" + productos[i].precio,
                                    fontSize: 16,
                                    color: const Color(0xFFa9b3bd)),
                                  const Divider(color: Colors.black),
                                  SizedBox(height: height * 0.02),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 8.0, left: 8.0,),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Align(
                                          alignment: Alignment.bottomRight,
                                          child: GestureDetector(
                                            child: ((!productos[i].addingWL)
                                              ? const Icon(
                                                  Icons.favorite_outline,
                                                  size: 33,)
                                              : const Icon(
                                                  Icons.favorite,
                                                  color: Colors.red,
                                                  size: 33,)
                                            ),
                                            onTap: () async {
                                              setState(() {
                                                productos[i].addingWL;
                                              });
                                              await wishApi.addProductToList(productos[i].id);
                                            },
                                        ),),
                                        Align(
                                          alignment: Alignment.bottomRight,
                                          child: IconButton(
                                            icon: const Icon(Icons.add_shopping_cart_outlined,
                                              color: Colors.black,
                                              size: 33,),
                                            onPressed: () async{
                                              showDialog(context: context, builder: (context) {
                                                Future.delayed(const Duration(seconds: 2), (){
                                                  Navigator.of(context).pop(true);});
                                                return AlertDialog(
                                                  title: const Text('Se agregó el producto al carrito'),
                                                  content: Image.asset("assets/images/success.png", 
                                                  height: 80,
                                                  width: 80,)
                                                );
                                              });
                                              await cartApi.addProductToCart(productos[i].id);
                                            },
                                  ))]))
                          ],))),
                  ],));
                }
    ),))],),);
  }
}
