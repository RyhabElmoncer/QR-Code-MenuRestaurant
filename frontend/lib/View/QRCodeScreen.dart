import 'package:flutter/material.dart';

class QRCodeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Gérer Code QR')),
      body: Center(
        child: Text('Code QR pour le menu'),
      ),
    );
  }
}
