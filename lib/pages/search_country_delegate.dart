import 'package:flutter/material.dart';
import 'package:prueba_agroshop/model/empresa.dart';
import 'package:prueba_agroshop/model/producto.dart';

import 'detailProduct_Page.dart';

class SearchCountryDelegate extends SearchDelegate {
  final List<ProductoInfo> articles;
  final List<Empresa> empresa;

  List<ProductoInfo> _filter = [];

  SearchCountryDelegate(this.articles, this.empresa);

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.close),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    IconButton(
      onPressed: () {
        close(
            context,
            ProductoInfo(
                id: 0,
                nombre: '',
                descripcion: '',
                precio: '',
                stock: 0,
                imagen: '',
                empresa: 0,
                subcategoria: 0,
                categoria: 0));
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return ListView.builder(
      itemCount: _filter.length,
      itemBuilder: (_, index) {
        return ListTile(
          title: Text(_filter[index].nombre),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // ignore: avoid_types_as_parameter_names, non_constant_identifier_names
    _filter = articles.where((ProductoInfo) {
      return ProductoInfo.nombre
          .toLowerCase()
          .contains(query.trim().toLowerCase());
    }).toList();
    return ListView.builder(
      itemCount: _filter.length,
      itemBuilder: (_, index) {
        return ListTile(
          title: Text(_filter[index].nombre),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DetailProductPage(
                          articleInfo: _filter[index],
                          empresaInfo: empresa[1],
                          index: 0,
                        )));
          },
        );
      },
    );
  }
}
