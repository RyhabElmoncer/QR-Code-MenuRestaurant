import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  final Map<String, String> menuItem;

  DetailsScreen({required this.menuItem});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF121212),
      appBar: AppBar(
        backgroundColor: Color(0xFF121212),
        title: Text(menuItem['item']!),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset('assets/images/${menuItem['image']}'),
            SizedBox(height: 16),
            Text(
              menuItem['item']!,
              style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              menuItem['price']!,
              style: TextStyle(color: Colors.orange, fontSize: 22),
            ),
            SizedBox(height: 16),
            Text(
              'Description of the coffee goes here. You can add more details about the item.',
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
