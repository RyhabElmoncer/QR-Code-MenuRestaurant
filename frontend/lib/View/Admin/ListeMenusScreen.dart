import 'package:flutter/material.dart';

class ListeMenusScreen extends StatelessWidget {
  final List<Menu> menus = [
    Menu(
      id: '1',
      name: 'Menu 1',
      dishes: [
        Dish(name: 'Pizza', description: 'pizza 4 saisson', price: 10.0, image: 'assets/palt1.png'),
        Dish(name: 'Makloub', description: 'makloub scallope', price: 12.0, image: 'assets/plat3.png'),
        Dish(name: 'Brik', description: 'Brik thon ', price: 12.0, image: 'assets/plats2.png'),

      ],
    ),
    Menu(
      id: '2',
      name: 'Menu 2',
      dishes: [
        Dish(name: 'Plat 3', description: 'Description du plat 3', price: 15.0, image: 'assets/plat1.png'),
        Dish(name: 'Plat 4', description: 'Description du plat 4', price: 18.0, image: 'assets/plat1.png'),
      ],
    ),
    // Ajoutez d'autres menus ici
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Liste des Menus'),
        backgroundColor: Colors.orange,
      ),
      body: ListView(
        children: menus.map((menu) => _buildMenuTile(menu)).toList(),
      ),
    );
  }

  Widget _buildMenuTile(Menu menu) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ExpansionTile(
            title: Text(
              menu.name,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.orange,
              ),
            ),
            trailing: Icon(Icons.arrow_drop_down, color: Colors.orange),
            children: menu.dishes.map((dish) => _buildDishTile(dish)).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildDishTile(Dish dish) {
    return ListTile(
      contentPadding: EdgeInsets.all(16),
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.asset(
          dish.image,
          fit: BoxFit.cover,
          width: 60, // Taille réduite
          height: 60, // Taille réduite
        ),
      ),
      title: Text(dish.name, style: TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(dish.description),
      trailing: Text(
        '\dt${dish.price.toStringAsFixed(2)}',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.orange,
        ),
      ),
    );
  }
}

class Menu {
  final String id;
  final String name;
  final List<Dish> dishes;

  Menu({
    required this.id,
    required this.name,
    required this.dishes,
  });
}

class Dish {
  final String name;
  final String description;
  final double price;
  final String image;

  Dish({
    required this.name,
    required this.description,
    required this.price,
    required this.image,
  });
}
