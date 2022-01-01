import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prueba_agroshop/model/empresa.dart';
import 'package:prueba_agroshop/model/producto.dart';
import 'package:prueba_agroshop/components/text_widget.dart';
import 'allProductos.dart';

class DetailProductPage extends StatefulWidget {
  final ProductoInfo articleInfo;
  final Empresa empresaInfo;
  final int index;
  DetailProductPage({
    Key? key,
    required this.articleInfo,
    required this.index,
    required this.empresaInfo,
  }) : super(key: key);

  @override
  _DetailProductPageState createState() => _DetailProductPageState();
}

class _DetailProductPageState extends State<DetailProductPage> {
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              toolbarHeight: 30,
              backgroundColor: const Color(0xFFffffff),
              elevation: 0.0,
            ),
            body: Container(
              color: Colors.white,
              padding: const EdgeInsets.only(left: 20),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.only(left: 0, right: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            padding: EdgeInsets.zero,
                            constraints: BoxConstraints(),
                            icon: const Icon(Icons.arrow_back_ios,
                                color: Color(0xFF363f93)),
                            onPressed: () => Navigator.pop(context))
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    child: Row(
                      children: [
                        Material(
                          elevation: 0.0,
                          child: Container(
                            height: 180,
                            width: 150,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 5,
                                      blurRadius: 7,
                                      offset: Offset(0, 3))
                                ],
                                image: DecorationImage(
                                    image: NetworkImage(
                                      "http://10.0.2.2:8000" +
                                          widget.articleInfo.imagen.toString(),
                                    ),
                                    fit: BoxFit.fill)),
                          ),
                        ),
                        Container(
                          width: screenWidth - 30 - 180 - 20,
                          margin: const EdgeInsets.only(left: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              TextWidget(
                                text: this.widget.articleInfo.nombre,
                                fontSize: 30,
                              ),
                              Divider(color: Colors.grey),
                              TextWidget(
                                text: "Empresa: " +
                                    this.widget.empresaInfo.nombre,
                                fontSize: 20,
                                color: Color(0xFF7b8ea3),
                              ),
                              Divider(color: Colors.grey),
                              TextWidget(
                                  text: "Stock: " +
                                      widget.articleInfo.stock.toString(),
                                  fontSize: 20,
                                  color: Color(0xFF7b8ea3)),
                              Divider(color: Colors.grey),
                              TextWidget(
                                  text: "Precio: " +
                                      this.widget.articleInfo.precio +
                                      " " +
                                      "Bs",
                                  fontSize: 20,
                                  color: Color(0xFF7b8ea3)),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Divider(color: Color(0xFF7b8ea3)),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      TextWidget(
                        text: "Descripcion del producto",
                        fontSize: 30,
                      ),
                      Expanded(child: Container())
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: 200,
                    child: TextWidget(
                        text: this.widget.articleInfo.descripcion,
                        fontSize: 16,
                        color: Colors.grey),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
