import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:prueba_agroshop/model/cart_item.dart';
import 'package:prueba_agroshop/pages/card_page.dart';
import 'package:prueba_agroshop/services/api.dart';
import 'package:prueba_agroshop/services/cart_services.dart';
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

  Future _getCartItems() async {
    await _initData();
  }

  _initData() async {
    await CallApi()
        .getPublicData("cartproduct/$idCarritoCliente")
        .then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        _cart = list.map((model) => CartProduct.fromJson(model)).toList();
      });
    });
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
      body: GestureDetector(onVerticalDragUpdate: (details) {
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
              //physics: const NeverScrollableScrollPhysics(),
              physics: const AlwaysScrollableScrollPhysics(),
              itemCount: _cart.length,
              itemBuilder: (context, index) { var item = _cart[index];
                return Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Expanded(
                                child: SizedBox(width: 100, height: 100,
                                  child: Image.network("http://10.0.2.2:8000" + item.imagen,
                                    fit: BoxFit.contain)),
                              ),
                              Column(
                                children: <Widget>[
                                  Text(item.nombre,
                                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0, color: Colors.black)),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      IconButton(icon: const Icon(Icons.chevron_left),
                                        onPressed: () async {
                                          await cartApi.removeProductToCart(item.productoid);
                                      }),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(item.cantidad.toString(),
                                          style: const TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.normal),),
                                      ),
                                      IconButton(icon: const Icon( Icons.chevron_right),
                                        onPressed: () async {
                                          await cartApi.addProductToCart(item.productoid);
                                        }),
                                    ],
                                  )
                                ],
                              ),
                              const SizedBox(width: 38.0,),
                              Text("Bs. " + item.precio,
                                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0, color: Colors.black)),
                              IconButton(icon: const Icon(Icons.cancel_outlined,color: Colors.grey),
                                onPressed: () async {
                                  await cartApi.deleteProductToCart(item.productoid);
                              },)
                            ],
                          )
                        ],
                      ),
                    ),
                    const Divider(color: Colors.grey)
                  ],
                );
            }),
            const SizedBox(width: 10.0,),
            //pagoTotal(_cart),
            const SizedBox(width: 20.0,),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => CardPage()));
                  },
                  child: PhysicalModel(
                    color: Colors.grey.withOpacity(.4),
                    elevation: 2,
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.black),
                      child: Container(
                        margin: const EdgeInsets.all(14),
                        alignment: Alignment.center,
                        // ignore: prefer_const_constructors
                        child: Text("Pagar Bs." + valorTotal(_cart),
                          style: const TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.normal),
                        ),
                    )),
                  ),
              )),
          ],
      ))),
    );
  }
}
