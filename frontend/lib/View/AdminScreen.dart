import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../Model/MenuItem.dart';

class AdminScreen extends StatefulWidget {
  @override
  _AdminScreenState createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  final List<MenuItem> _menuItems = [];
  final _formKey = GlobalKey<FormState>();
  String _itemName = '';
  String _itemPrice = '';
  String _itemImage = '';

  void _addItem() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      setState(() {
        _menuItems.add(MenuItem(item: _itemName, price: _itemPrice, image: _itemImage));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin - Create Menu'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Item Name'),
                    onSaved: (value) => _itemName = value!,
                    validator: (value) => value!.isEmpty ? 'Enter item name' : null,
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Item Price'),
                    onSaved: (value) => _itemPrice = value!,
                    validator: (value) => value!.isEmpty ? 'Enter item price' : null,
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: 'Item Image'),
                    onSaved: (value) => _itemImage = value!,
                    validator: (value) => value!.isEmpty ? 'Enter item image path' : null,
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _addItem,
                    child: Text('Add Item'),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _menuItems.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_menuItems[index].item),
                    subtitle: Text(_menuItems[index].price),
                  );
                },
              ),
            ),



          ],

    ), ),
    );
  }
}
