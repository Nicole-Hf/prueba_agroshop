import 'package:flutter/material.dart';
import 'package:prueba_agroshop/model/menu_item.dart';

class MenuItems {
  static const List<MenuItem> itemFirst = [
    itemLogout,
  ];

  static const itemLogout = MenuItem(
    text: 'Logout',
    icon: Icons.logout,
  );
}