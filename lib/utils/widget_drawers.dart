import 'package:flutter/material.dart';
import 'package:prueba_agroshop/pages/onboarding_page.dart';
import 'package:prueba_agroshop/pages/producto_page.dart';

class MenuLateral extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      //Drawer para crear el menu
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            //Aca definimos el logo en el menu desplegable
            decoration: BoxDecoration(
              color: Colors.blueGrey,
            ),
            child: Column(
              children: [
                Expanded(
                  child: Image.asset('assets/images/logo.png'),
                ),
                SizedBox(
                  height: 10.0,
                ),
              ],
            ),
          ),
          ListTile(
            //Asi definimos nuevos campos para interactuar y redireccionarlos a nuestras rutas
            leading: Icon(Icons.home),
            title: Text('Inicio'),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (BuildContext context) => ProductoPage(),
              ));
            },
          ),
          ListTile(
            //Asi definimos nuevos campos para interactuar y redireccionarlos a nuestras rutas
            leading: Icon(Icons.favorite),
            title: Text('Mi Lista de Deseos'),
            onTap: () {
              
            },
          ),
          ListTile(
            //Asi definimos nuevos campos para interactuar y redireccionarlos a nuestras rutas
            leading: Icon(Icons.delivery_dining_outlined),
            title: Text('Mis Pedidos'),
            onTap: () {
              
            },
          ),
          ListTile(
            //Asi definimos nuevos campos para interactuar y redireccionarlos a nuestras rutas
            leading: Icon(Icons.bedtime_rounded),
            title: Text('Log Out'),
            onTap: () {
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => OnboardingPage()), 
                (route) => false
              );
            },
          ),
        ],
      ),
    );
  }
}
