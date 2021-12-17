import 'package:flutter/material.dart';
import 'package:prueba_agroshop/pages/onboarding_page.dart';
import 'package:prueba_agroshop/pages/producto_page.dart';
import 'package:prueba_agroshop/pages/wishlist_page.dart';

// ignore: use_key_in_widget_constructors, must_be_immutable
class MenuLateral extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Drawer(
      //Drawer para crear el menu
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.black,),
            child: Column(
              children: [
                Expanded(child: Image.asset('assets/images/logo.png'),),
                const SizedBox(height: 10.0,),
              ],
          ),),
          ListTile(
            //Asi definimos nuevos campos para interactuar y redireccionarlos a nuestras rutas
            leading: const Icon(Icons.home),
            title: const Text('Inicio'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (BuildContext context) => ProductoPage(),));
            },
          ),
          ListTile(
            //Asi definimos nuevos campos para interactuar y redireccionarlos a nuestras rutas
            leading: const Icon(Icons.favorite),
            title: const Text('Mi Lista de Deseos'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (BuildContext context) => WishlistPage(),));              
            },
          ),
          ListTile(
            //Asi definimos nuevos campos para interactuar y redireccionarlos a nuestras rutas
            leading: const Icon(Icons.delivery_dining_outlined),
            title: const Text('Mis Pedidos'),
            onTap: () {
              
            },
          ),
          ListTile(
            //Asi definimos nuevos campos para interactuar y redireccionarlos a nuestras rutas
            leading: const Icon(Icons.bedtime_rounded),
            title: const Text('Log Out'),
            onTap: () {
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => OnboardingPage()), (route) => false);
            },
          ),
        ],
    ),);
  }
}
