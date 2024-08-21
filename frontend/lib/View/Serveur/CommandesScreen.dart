import 'package:flutter/material.dart';

import '../../Model/Order.dart';

class CommandesScreen extends StatefulWidget {
  @override
  _CommandesScreenState createState() => _CommandesScreenState();
}

class _CommandesScreenState extends State<CommandesScreen> {
  // Example list of orders
  final List<Order> orders = [
    Order(id: '1', title: 'Pizza Margherita', status: 'En cours', details: 'Détails de la commande 1'),
    Order(id: '2', title: 'Spaghetti ', status: 'En cours', details: 'Détails de la commande 2'),
    Order(id: '3', title: 'Chapatie', status: 'Terminé', details: 'Détails de la commande 2'),
    Order(id: '4', title: 'Makloub', status: 'En cours', details: 'Détails de la commande 3'),
    Order(id: '5', title: 'Brik', status: 'Terminé', details: 'Détails de la commande 2'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listes des Commandes'),
        backgroundColor: Colors.orangeAccent,
      ),
      body: ListView.builder(
        itemCount: orders.length,
        itemBuilder: (context, index) {
          final order = orders[index];
          return Card(
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            elevation: 4,
            child: ListTile(
              contentPadding: EdgeInsets.all(16),
              leading: Icon(
                Icons.restaurant_menu,
                color: Colors.orange,
                size: 40,
              ),
              title: Text(
                order.title,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                'Statut: ${order.status}',
                style: TextStyle(color: _getStatusColor(order.status)),
              ),
              onTap: () => _showOrderDetails(context, order),
            ),
          );
        },
      ),
    );
  }

  // Show order details and allow changing the status
  void _showOrderDetails(BuildContext context, Order order) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Détails de la Commande'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Titre: ${order.title}', style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 8),
              Text('Détails: ${order.details}'),
              SizedBox(height: 8),
              Text('Statut: ${order.status}', style: TextStyle(color: _getStatusColor(order.status))),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => _changeOrderStatus(order, 'En cours'),
              child: Text('Marquer comme En cours', style: TextStyle(color: Colors.red)),
            ),
            TextButton(
              onPressed: () => _changeOrderStatus(order, 'Terminé'),
              child: Text('Marquer comme Terminé', style: TextStyle(color: Colors.green)),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Annuler', style: TextStyle(color: Colors.red)),
            ),
          ],
        );
      },
    );
  }

  // Update the status of an order
  void _changeOrderStatus(Order order, String newStatus) {
    setState(() {
      final index = orders.indexWhere((o) => o.id == order.id);
      if (index != -1) {
        orders[index] = Order(
          id: order.id,
          title: order.title,
          status: newStatus,
          details: order.details,
        );
      }
    });
    Navigator.of(context).pop(); // Close the dialog after status change
  }

  // Function to get color based on status
  Color _getStatusColor(String status) {
    switch (status) {
      case 'En cours':
        return Colors.red; // Red for "En cours"
      case 'Terminé':
        return Colors.green; // Green for "Terminé"
      default:
        return Colors.black; // Default color
    }
  }
}
