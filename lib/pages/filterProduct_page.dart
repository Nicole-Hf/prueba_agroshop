// ignore_for_file: file_names
import 'dart:convert';

import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:prueba_agroshop/model/producto.dart';
import 'package:prueba_agroshop/pages/cart_page.dart';
import 'package:prueba_agroshop/utils/product_tile.dart';
import 'package:prueba_agroshop/services/api.dart';
import 'package:prueba_agroshop/variables.dart';

// ignore: use_key_in_widget_constructors
class FilterPage extends StatefulWidget {
  // ignore: prefer_const_declarations
  static final routeName = 'categProduct';

  @override
  _FilterPageState createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  var filterProducts = <ProductoInfo>[];

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
    await CallApi()
        .getPublicData("category/products/$idCategory")
        .then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        filterProducts =
            list.map((model) => ProductoInfo.fromJson(model)).toList();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.shopping_cart,),
            onPressed: () {
              Navigator.push(
                context, MaterialPageRoute(builder: (context) => CartPage()));
          },)
      ],),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    category,
                    style: const TextStyle(
                      fontFamily: 'avenir',
                      fontSize: 32,
                      fontWeight: FontWeight.w900),
                ),),
                IconButton(icon: const Icon(Icons.view_list_rounded), onPressed: () {}),
                IconButton(icon: const Icon(Icons.grid_view), onPressed: () {}),
          ],),),
          Expanded(
            child: StaggeredGridView.countBuilder(
              crossAxisCount: 2,
              itemCount: filterProducts.length,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              itemBuilder: (context, index) {           
                return ProductTile(filterProducts[index]);
              },
              staggeredTileBuilder: (index) => const StaggeredTile.fit(1),
          )),
        ],
      ),
    );
  }
}
