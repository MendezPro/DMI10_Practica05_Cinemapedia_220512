import 'package:flutter/material.dart';

class CustomButtonNavigationbar extends StatelessWidget {
  const CustomButtonNavigationbar({super.key});

  @override
  Widget build(BuildContext context) {
   return BottomNavigationBar(
    items: [
      BottomNavigationBarItem(
        icon: Icon(Icons.home_max),
        label: 'Incio'
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.label_outlined),
        label: 'Categorias'
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.favorite_outlined),
        label: 'Favoritos'
      )
    ]
   );
  }
}