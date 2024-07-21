import 'package:flutter/material.dart';
import 'View/AdminScreen.dart';
import 'View/AuthScreen.dart';
import 'View/ClientScreen.dart';
import 'View/DetailsScreen.dart';
import 'View/LoginScreen.dart';
import 'View/MenuScreen.dart';
import 'View/QRCodeScreen.dart';
import 'View/SplashScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mon Application',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/',
      routes: {
        '/': (context) => ClientScreen(),
        '/login': (context) => LoginScreen(),
        '/menu': (context) => MenuScreen(),
        '/qrCode': (context) => QRCodeScreen(),
        '/Onboarding3': (context) => Onboarding3(),
      //  '/details': (context) => DetailsScreen(menuItem: _menuItems[index]),

      },
    );
  }
}
