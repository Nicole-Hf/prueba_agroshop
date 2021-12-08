import 'package:flutter/material.dart';
import 'package:prueba_agroshop/model/producto.dart';
import 'package:prueba_agroshop/utils/rounded_button.dart';
import 'package:prueba_agroshop/utils/text_widget.dart';

class Cart extends StatefulWidget {
  final List<ProductoInfo> _cart;

  Cart(this._cart);


  @override
  _CartState createState() => _CartState(this._cart);
}

class _CartState extends State<Cart> {
  _CartState(this._cart);
  final _scrollController = ScrollController();
  var _firstScroll = true;
  bool _enable = false;

  List<ProductoInfo> _cart;

  Container pagoTotal(List<ProductoInfo> _cart) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.only(left: 120),
      height: 70,
      width: 400,
      color: Colors.grey[200],
      child: Row(
        children: <Widget>[
          Text("Total: \Bs.-${valorTotal(_cart)}",
            style: new TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
              color: Colors.black
            ),
          )
        ],
      ),
    );
  }

  String valorTotal(List<ProductoInfo> listaProductos) {
    double total = 0.0;

    for (int i = 0; i < listaProductos.length; i++) {
      total = total + double.parse(listaProductos[i].precio) * listaProductos[i].cantidad;
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
          title: const Text(
            'AgroShop',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
      ),
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
              SizedBox(height: 20,),
              ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: _cart.length,
                itemBuilder: (context, index) {
                  final String imagen = _cart[index].imagen;
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
                                  child: Container(
                                    width: 100,
                                    height: 100,
                                    child: new Image.network(
                                      "http://10.0.2.2:8000" + _cart[index].imagen,
                                      fit: BoxFit.contain
                                    )
                                  ),
                                ),
                                Column(
                                  children: <Widget>[
                                    Text(
                                      item.nombre,
                                      style: new TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16.0,
                                        color: Colors.black
                                      )
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Container(
                                          width: 120,
                                          height: 40,
                                          decoration: BoxDecoration(
                                            color: Colors.red[600],
                                            boxShadow: [
                                              BoxShadow(
                                                blurRadius: 6.0,
                                                color: Colors.blue,
                                                offset: Offset(0.0, 1.0),
                                              )
                                            ],
                                            borderRadius: BorderRadius.all(Radius.circular(50.0),)
                                          ),
                                          margin: EdgeInsets.only(top: 20.0),
                                          padding: EdgeInsets.all(2.0),
                                          child: new Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              SizedBox(height: 8.0),
                                              IconButton(
                                                onPressed: () {
                                                  _removeProduct(index);
                                                  valorTotal(_cart);
                                                }, 
                                                icon: Icon(Icons.remove),
                                                color: Colors.white,
                                              ),
                                              TextWidget(
                                                text: _cart[index].cantidad.toString(),
                                                fontSize: 22,
                                                color: Colors.white
                                              ),
                                              IconButton(
                                                onPressed: () {
                                                  _addProduct(index);
                                                  valorTotal(_cart);
                                                }, 
                                                icon: Icon(Icons.add),
                                                color: Colors.yellow,
                                              ),
                                              SizedBox(height: 8.0,)
                                            ],
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                                SizedBox(width: 38.0,),
                                Text(
                                  item.precio.toString(),
                                  style: new TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24.0,
                                    color: Colors.black
                                  )
                                ),
                                Container(
                                  child: IconButton( 
                                    onPressed:() {
                                      _deleteProduct(index);         
                                    },
                                    icon: Icon(Icons.cancel_outlined,
                                    color: Colors.grey
                                    )
                                  )                                
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      Divider(color: Colors.greenAccent,)
                    ],
                  );  
                }
              ),
              SizedBox(width: 10.0,),
              pagoTotal(_cart),
              SizedBox(width: 20.0,),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: SizedBox(
                width: 220,
                height: 60,
                child: FlatButton(
                textColor: Colors.white,
                color: Colors.green,   
                onPressed: () {
                  //Navigator.push(context,MaterialPageRoute(
                    //builder: (BuildContext context) => const EnvioPage(),
                  //));              
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 8, right: 8, top: 10, bottom: 10),
                  child: Text("Comprar",
                  style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 22.0))),
                  ),
                ),
              ),
            ],
          )
        )
      ),
    );
  }

  _addProduct(int index) {
    setState(() {
      _cart[index].cantidad++;
    });
  }

  _removeProduct(int index) {
    setState(() {
      _cart[index].cantidad--;
    });
  }

  _deleteProduct(int index) {
    setState(() {
      _cart.remove(_cart[index]);
    });
  }
}