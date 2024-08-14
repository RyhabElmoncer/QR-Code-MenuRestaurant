import 'package:flutter/material.dart';
import 'View/AuthScreen.dart';
import 'View/LoginScreen.dart';
import 'View/SplashScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mon Application',
      theme: ThemeData(
        primarySwatch: Colors.orange, // Mise à jour du thème en orange
      ),
      home: SplashScreen(), // Écran de démarrage
      debugShowCheckedModeBanner: false, // Masque le logo de débogage
      routes: {
        '/AuthScreen': (context) => AuthScreen(),
        '/Login': (context) => LoginScreen(),
      },
    );
  }
}
