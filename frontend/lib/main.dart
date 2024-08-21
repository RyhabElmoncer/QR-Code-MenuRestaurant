import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Auth/Authviewmodel.dart';
import 'View/Admin/AdminScreen.dart';
import 'View/Admin/AjouterServeurScreen.dart';  // Importez l'écran pour ajouter un serveur
import 'View/Admin/ListeServeursScreen.dart';  // Importez l'écran pour la liste des serveurs
import 'View/Admin/ListeMenusScreen.dart';     // Importez l'écran pour la liste des menus
import 'View/Admin/ConfigurationScreen.dart';  // Importez l'écran pour la configuration
import 'View/Client/MenuPage.dart';
import 'View/Client/QRScanScreen.dart';
import 'View/Client/RestaurantMenuScreen.dart';
import 'View/Serveur/Serveurprofil.dart';
import 'View/auth/Screens/AuthScreen.dart';
import 'View/auth/Screens/LoginScreen.dart';
import 'View/SplashScreen.dart';
import 'View/auth/Screens/SignUpScreen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => AuthViewModel(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AuthScreen(),
      routes: {
        '/signUp': (context) => SignUpScreen(),
        '/QRScanPage': (context) => QRScanPage(),
        '/adminScreen': (context) => AdminScreen(),
        '/ajouterServeur': (context) => AjouterServeurScreen(), // Ajoutez la route pour Ajouter Serveur
        '/listeServeurs': (context) => ListeServeursScreen(),  // Ajoutez la route pour Liste Serveurs
       '/ServeurScreen': (context) => ServerProfileScreen(),    // Ajoutez la route pour Statistiques
        '/listeMenus': (context) => ListeMenusScreen(),        // Ajoutez la route pour Liste Menus
        '/configuration': (context) => ConfigurationScreen(),  // Ajoutez la route pour Configuration
      },
    );
  }
}
