import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prueba_agroshop/model/producto.dart';
import 'package:prueba_agroshop/services/cart_services.dart';
import 'package:prueba_agroshop/services/wish_services.dart';

// ignore: must_be_immutable
class ProductTile extends StatelessWidget {
  final ProductoInfo product;
  WishlistService wishApi = WishlistService();
  CartService cartApi = CartService();
  // ignore: use_key_in_widget_constructors
  ProductTile(this.product);
  
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 180,
                  width: double.infinity,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Image.network(
                    "http://10.0.2.2:8000" + product.imagen,
                    fit: BoxFit.cover,
                ),),
                Positioned(
                  right: 0,
                  child: Obx(() => CircleAvatar(
                    backgroundColor: Colors.white70,
                    child: IconButton(
                      icon: product.isFavorite.value                     
                      ? const Icon(Icons.favorite_rounded, color: Colors.red,)
                      : const Icon(Icons.favorite_border, color: Colors.black,),
                      onPressed: () async {
                        product.isFavorite.toggle();
                        await wishApi.addProductToList(product.id);
                      },
                    ),
                  )),
                )
            ],),
            const SizedBox(height: 8),
            Text(
              product.nombre,
              maxLines: 2,
              style: const TextStyle(fontSize: 16, fontFamily: 'avenir', fontWeight: FontWeight.w800),
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.only(right: 8.0, left: 8.0,),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Text('Bs.-${product.precio}',
                      style: const TextStyle(fontSize: 25, fontFamily: 'avenir')),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: IconButton(
                      icon: const Icon(Icons.add_shopping_cart_outlined,
                        color: Colors.black,
                        size: 33,),
                      onPressed: () async{
                        showDialog(context: context, 
                        builder: (context) {
                          Future.delayed(const Duration(seconds: 2), (){
                            Navigator.of(context).pop(true);
                          });
                          return AlertDialog(
                            title: const Text('Se agregó el producto al carrito'),
                            content: Image.asset("assets/images/success.png", 
                              height: 80,
                              width: 80,)
                          );
                        });
                        await cartApi.addProductToCart(product.id);
                      },
                    )
                  )
                ],
            ))
          ],
        ),
      ),
    );
  }
}