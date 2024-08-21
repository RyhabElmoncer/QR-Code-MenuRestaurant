import 'package:flutter/material.dart';

import '../../Model/Plats.dart';

class MenuPage extends StatelessWidget {
  final List<Plat> menu;

  MenuPage({required this.menu});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu'),
        backgroundColor: Colors.orange,
      ),
      body: ListView.builder(
        itemCount: menu.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 5,
            margin: EdgeInsets.all(10),
            child: ListTile(
              leading: Image.asset(menu[index].imageUrl, width: 80, height: 80),
              title: Text(menu[index].nom, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              subtitle: Text(menu[index].description),
              trailing: Text('\$${menu[index].prix.toStringAsFixed(2)}', style: TextStyle(fontSize: 18, color: Colors.green)),
              onTap: () {
                // Naviguer vers la page de commande ou ajouter au panier
              },
            ),
          );
        },
      ),
    );
  }
}
