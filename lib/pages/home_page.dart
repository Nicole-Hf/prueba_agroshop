import 'package:flutter/material.dart';
import 'package:prueba_agroshop/datas/menu_items.dart';
import 'package:prueba_agroshop/model/menu_item.dart';
import 'package:prueba_agroshop/pages/onboarding_page.dart';
import 'package:prueba_agroshop/pages/producto_page.dart';
import 'package:prueba_agroshop/utils/Theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

/// This is the private State class that goes with HomePage.
class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  //static const List<Widget> _widgetOptions = <Widget>[
  List<Widget> _widgetOptions = [
    ProductoPage(),
    Text(
      'Index 1: Lista de deseos',
      style: optionStyle,
    ),
    Text(
      'Index 2: Carrito',
      style: optionStyle,
    ),
    Text(
      'Index 3: Settings',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          actions: [
            PopupMenuButton<MenuItem>(
              onSelected: (item) => onSelected(context, item),
              itemBuilder: (context) => [
                ...MenuItems.itemFirst.map(buildItem).toList(),
              ],
            ),
          ],
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: MaterialColors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Wishlist',
            backgroundColor: MaterialColors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_shopping_cart_sharp),
            label: 'Cart',
            backgroundColor: MaterialColors.black,
            
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.delivery_dining_outlined),
            label: 'My orders',
            backgroundColor: MaterialColors.black,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.lightGreen,
        onTap: _onItemTapped,
      ),
    );
  }

  PopupMenuItem<MenuItem> buildItem(MenuItem item) => PopupMenuItem<MenuItem>(
    value: item,
    child: Row(
      children: [
        Icon(item.icon,
        color: Colors.black,
        size: 20),
        const SizedBox(width: 12),
        Text(item.text),
      ],
    ),
  );

  void onSelected(BuildContext context, MenuItem item) {
    switch(item) {
      case MenuItems.itemLogout:
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => OnboardingPage()), 
          (route) => false
        );
      break;
    }
  }
}
