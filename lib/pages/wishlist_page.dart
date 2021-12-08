import 'package:flutter/material.dart';
import 'package:prueba_agroshop/model/producto.dart';
import 'package:prueba_agroshop/utils/Theme.dart';
import 'package:prueba_agroshop/utils/text_widget.dart';
import 'package:prueba_agroshop/utils/widget_drawers.dart';

class Wishlist extends StatefulWidget {
  final List<ProductoInfo> _wishlist;

  Wishlist(this._wishlist);

  @override
  _WishlistState createState() => _WishlistState(this._wishlist);
}

class _WishlistState extends State<Wishlist> {
  _WishlistState(this._wishlist);

  List<ProductoInfo> _wishlist;

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
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
      drawer: MenuLateral(),
      body: Container(
        color: Colors.white,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: height * 0.02,),
              SizedBox(height: 15,),
              Expanded(
                child: SingleChildScrollView(
                  child: _wishlist.length == 0
                      ? CircularProgressIndicator()
                      : Column(
                          children: _wishlist.map((article) {
                            debugPrint(article.imagen.toString());
                            return GestureDetector(
                              onTap: () {
                                  /*Navigator.push(
                                  context,
                                  MaterialPageRoute(
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
                                              offset: new Offset(0.0, 0.0),
                                              blurRadius: 20.0,
                                              spreadRadius: 4.0
                                            )
                                          ],
                                        ),
                                      )
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
                                              "http://10.0.2.2:8000" + article.imagen.toString(),
                                            ),
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
                                            text: article.nombre,
                                            fontSize: 20,
                                            color: MaterialColors.black,
                                          ),
                                          SizedBox(height: height * 0.02),
                                          TextWidget(
                                            text: "Bs.-" + article.precio,
                                            fontSize: 16,
                                            color: Color(0xFFa9b3bd)
                                          ),
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
                                                      (!_wishlist.contains(article))
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
                                                        if (!_wishlist.contains(article))
                                                          _wishlist.add(article);
                                                        else
                                                          _wishlist.remove(article);
                                                      });
                                                    },
                                                  ),
                                                ),
                                              ]
                                            )
                                          )
                                        ],
                                      )
                                    )
                                  ),
                                ],
                              )
                            )
                          );
                        }
                      ).toList(),
                    ),
                ),
              ),
            ],
          )
        ),
      )
    );
  }
}
