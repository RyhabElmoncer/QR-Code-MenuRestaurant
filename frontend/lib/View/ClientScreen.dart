import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../Model/MenuItem.dart';

class ClientScreen extends StatefulWidget {
  @override
  _ClientScreenState createState() => _ClientScreenState();
}

class _ClientScreenState extends State<ClientScreen> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  List<MenuItem> _menuItems = [];

  void _onQRViewCreated(QRViewController controller) {
    controller.scannedDataStream.listen((scanData) {
      final List<Map<String, String>> decodedData = List<Map<String, String>>.from(
        scanData.code!.split('},{').map((item) {
          item = item.replaceAll('[', '').replaceAll(']', '').replaceAll('{', '').replaceAll('}', '');
          return Map<String, String>.fromIterable(
            item.split(','),
            key: (e) => e.split(':')[0].trim(),
            value: (e) => e.split(':')[1].trim(),
          );
        }),
      );

      setState(() {
        _menuItems = decodedData.map((item) => MenuItem.fromMap(item)).toList();
      });
      controller.dispose();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Client - Scan QR Code'),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 5,
            child: QRView(
              key: qrKey,
              onQRViewCreated: _onQRViewCreated,
            ),
          ),
          Expanded(
            flex: 5,
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
      ),
    );
  }
}
