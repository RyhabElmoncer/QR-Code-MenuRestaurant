import 'package:flutter/material.dart';

import '../../Model/users.dart';
import 'CommandesScreen.dart';
import 'CreateMenuScreen.dart';

class ServerProfileScreen extends StatelessWidget {
  // Simule un utilisateur de serveur pour cet exemple
  final User serveur = User(id: '1', name: 'Ahmed', email: 'Ahmed@gmail.com');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // Définir l'image de fond
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/imgg.png'), // Assurez-vous que l'image existe
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Avatar centré avec les informations du serveur
              Center(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 60,
                      backgroundColor: Colors.orange, // Couleur de fond de l'avatar
                      child: Icon(
                        Icons.person,
                        size: 60, // Taille de l'icône
                        color: Colors.white, // Couleur de l'icône
                      ),
                    ),
                    SizedBox(height: 16),
                    Container(
                     // color: Colors.white.withOpacity(0.7), // Fond semi-transparent pour la lisibilité
                      padding: EdgeInsets.all(16),
                      child: Column(
                        children: [

                          SizedBox(height: 8),
                          Text(
                            serveur.email,
                            style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24),
              // Liste des titres avec les actions
              Expanded(
                child: ListView(
                  children: [
                    _buildMenuItem(context, 'Créer un Menu', Icons.menu, () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CreateMenuScreen(),
                        ),
                      );
                    }),
                    _buildMenuItem(context, 'Afficher les Commandes', Icons.list, () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CommandesScreen(),
                        ),
                      );
                    }),
                    _buildMenuItem(context, 'Déconnexion', Icons.exit_to_app, () {
                      _showLogoutConfirmationDialog(context);
                    }),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuItem(BuildContext context, String title, IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        margin: EdgeInsets.symmetric(vertical: 4),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.8),
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 6,
              offset: Offset(0, 2), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(icon, color: Colors.orange, size: 28),
            SizedBox(width: 16),
            Expanded(
              child: Text(
                title,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showLogoutConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Déconnexion'),
          content: Text('Êtes-vous sûr de vouloir vous déconnecter ?'),
          actions: [
            TextButton(
              child: Text('Annuler'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Déconnexion'),
              onPressed: () {
                // Logique de déconnexion ici
                Navigator.of(context).pop();
                Navigator.of(context).pushReplacementNamed('/login');
              },
            ),
          ],
        );
      },
    );
  }
}
