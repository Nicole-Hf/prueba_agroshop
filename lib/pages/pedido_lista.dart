import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:prueba_agroshop/model/carrito.dart';
import 'package:prueba_agroshop/pages/card_page.dart';
import 'package:prueba_agroshop/pages/envio_page.dart';
import 'package:prueba_agroshop/services/api.dart';
import 'package:prueba_agroshop/services/cart_services.dart';
import 'package:prueba_agroshop/utils/text_widget.dart';
import 'package:prueba_agroshop/variables.dart';

// ignore: use_key_in_widget_constructors
class CartPage extends StatefulWidget {
  // ignore: prefer_const_declarations
  static final routeName = 'carrito';

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final _scrollController = ScrollController();
  // ignore: prefer_final_fields
  var _cart = <CartProduct>[];
  var _firstScroll = true;
  // ignore: prefer_final_fields
  bool _enable = false;

  CartService cartApi = CartService();

  @override
  void initState() {
    _getCartItems();
    super.initState();
  }

  _getCartItems() async {
    await _initData();
  }

  //llamada a las API
  _initData() async {
    await CallApi().getPublicData("cartproduct/$idCarritoCliente").then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        _cart = list.map((model) => CartProduct.fromJson(model)).toList();
      });
    });
  }

  Container pagoTotal(List<CartProduct> _cart) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.only(left: 120),
      height: 70,
      width: 400,
      color: Colors.grey[200],
      child: Row(
        children: <Widget>[
          Text(
            "Total: Bs.-${valorTotal(_cart)}",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
              color: Colors.black
            ),
          )
        ],
      ),
    );
  }

  String valorTotal(List<CartProduct> listaProductos) {
    double total = 0.0;

    for (int i = 0; i < listaProductos.length; i++) {
      total += double.parse(listaProductos[i].precio) * listaProductos[i].cantidad;
    }

    return total.toStringAsFixed(2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        elevation: 0,
        title: const Text('AgroShop',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,),),),
      body: GestureDetector(
        onVerticalDragUpdate: (details) {
          if (_enable && _firstScroll) {
            _scrollController.jumpTo(_scrollController.position.pixels - details.delta.dy);
          }
        },
        onVerticalDragEnd: (_) {
          if (_enable) _firstScroll = false;
        },
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              const SizedBox(height: 20,),
              ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _cart.length,
                itemBuilder: (context, index) {
                  var item = _cart[index];
                  return Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
                        child: Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Expanded(
                                  child: SizedBox(
                                    width: 100,
                                    height: 100,
                                    child: Image.network("http://10.0.2.2:8000" + item.imagen,
                                      fit: BoxFit.contain
                                )),),
                                Column(
                                  children: <Widget>[
                                    Text(
                                      item.nombre,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16.0,
                                        color: Colors.black)),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Container(
                                          width: 120,
                                          height: 40,
                                          decoration: BoxDecoration(
                                            color: Colors.amber[700],
                                              // ignore: prefer_const_literals_to_create_immutables
                                              boxShadow: [
                                                // ignore: prefer_const_constructors
                                                BoxShadow(
                                                  blurRadius: 6.0,
                                                  color: Colors.black,
                                                  offset: const Offset(0.0, 1.0),)],
                                              borderRadius: const BorderRadius.all(Radius.circular(50.0),)),
                                          margin: const EdgeInsets.only(top: 20.0),
                                          padding: const EdgeInsets.all(2.0),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              const SizedBox(height: 8.0),
                                              IconButton(
                                                onPressed: () async{
                                                  await cartApi.removeProductToCart(item.productoid);
                                                },
                                                icon: const Icon(Icons.remove),
                                                color: Colors.white,),
                                              TextWidget(
                                                text: item.cantidad.toString(),
                                                fontSize: 22,
                                                color: Colors.white),
                                              IconButton(
                                                onPressed: () async {                                                
                                                  await cartApi.addProductToCart(item.productoid);
                                                },
                                                icon: const Icon(Icons.add),
                                                color: Colors.white,),
                                              const SizedBox(height: 8.0,)
                                        ],),)
                                    ],)
                                ],),
                                const SizedBox(width: 38.0,),
                                Text(
                                  item.precio,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24.0,
                                    color: Colors.black
                                  )
                                ),
                                IconButton(
                                  onPressed: () async{
                                    await cartApi.deleteProductToCart(item.productoid);                                                         
                                  },
                                  icon: const Icon(
                                    Icons.cancel_outlined,
                                    color: Colors.grey))
                          ],)
                    ],),),
                    const Divider(color: Colors.greenAccent,)
                ],);
              }),
              const SizedBox(width: 10.0,),
              pagoTotal(_cart),
              const SizedBox(width: 20.0,),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: SizedBox(
                  width: 220,
                  height: 60,
                  // ignore: deprecated_member_use
                  child: FlatButton(
                    textColor: Colors.white,
                    color: Colors.green,
                    onPressed: () {
                      Navigator.push(context,MaterialPageRoute(
                        builder: (BuildContext context) => CardPage(),
                      ));
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),),
                    child: const Padding(
                      padding: EdgeInsets.only(left: 8, right: 8, top: 10, bottom: 10),
                      child: Text("Comprar",
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 22.0))
              ),),),),
      ],))),
    );
  }
}