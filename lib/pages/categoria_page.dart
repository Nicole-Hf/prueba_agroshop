import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:prueba_agroshop/model/categoria.dart';
import 'package:prueba_agroshop/model/subcategoria.dart';
import 'package:prueba_agroshop/services/api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CategoriaPage extends StatefulWidget {
  //const ProductoPage({required Key key}) : super(key: key);
  static const String route = 'categorias';

  @override
  _CategoriaPageState createState() => _CategoriaPageState();
}

class _CategoriaPageState extends State<CategoriaPage> {
  var listaCategorias = <Categoria>[];
  var listaSubcateg = <Subcategoria>[];
  final List<CategoriaList> data = <CategoriaList>[];
  final List<SubcategoriaList> sublist = <SubcategoriaList>[];

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
    await CallApi().getPublicData("allcategories").then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        listaCategorias =
            list.map((model) => Categoria.fromJson(model)).toList();
      });
    });

    await CallApi().getPublicData("allsubcateg").then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        listaSubcateg =
            list.map((model) => Subcategoria.fromJson(model)).toList();
      });
    });
  }

  _llenarCategoria() {
    for (int i = 0; i < listaCategorias.length; i++) {
      data[i].nombre = listaCategorias[i].nombre;
      for (int j = 0; j < listaSubcateg.length; j++) {
        int pos = 0;
        if (listaSubcateg[j].categoria_id == listaCategorias[i].id) {
          sublist[pos].nombre = listaSubcateg[j].nombre;
          pos++;
        }
      }
      data[i].listSub = sublist;
    }
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    debugPrint(height.toString());
    //_llenarCategoria();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        elevation: 0,
        title: const Text(
          'AgroShop',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) =>
            MyExpandableWidget(data[index]),
        itemCount: data.length,
      ),
    );
  }
}

class MyExpandableWidget extends StatelessWidget {
  final CategoriaList categ;

  MyExpandableWidget(this.categ);

  @override
  Widget build(BuildContext context) {
    if (categ.listSub.isEmpty) return ListTile(title: Text(categ.nombre));
    return ExpansionTile(
      key: PageStorageKey<CategoriaList>(categ),
      title: Text(categ.nombre,
          style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.pinkAccent)),
      children:
          categ.listSub.map<Widget>((sub) => _showSubcategorias(sub)).toList(),
    );
  }
}

_showSubcategorias(SubcategoriaList sub) {
  return new ListTile(
    title: new Text(
      sub.nombre,
      style: new TextStyle(fontSize: 20),
    ),
  );
}

class CategoriaList {
  String nombre;
  List<SubcategoriaList> listSub;

  CategoriaList(this.nombre, this.listSub);
}

class SubcategoriaList {
  String nombre;

  SubcategoriaList(this.nombre);
}
