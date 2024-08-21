import 'package:flutter/material.dart';
import '../../Model/users.dart';

class ListeServeursScreen extends StatelessWidget {
  final List<User> serveurs = [
    User(id: '1', name: 'Serveur 1', email: 'Kousay@gmail.com'),
    User(id: '2', name: 'Serveur 2', email: 'Ahmed@gmail.com.com'),
    User(id: '3', name: 'Serveur 3', email: 'Ali@gmail.com.com'),
    // Ajoutez d'autres serveurs ici
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Liste des Serveurs'),
        backgroundColor: Colors.white,
      ),
      body: Stack(
        children: [
          // Image de fond
          Positioned.fill(
            child: Image.asset(
              'assets/ser.png', // Remplacez par le chemin de votre image de fond
              fit: BoxFit.cover,
            ),
          ),
          // Liste des serveurs
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView.builder(
              itemCount: serveurs.length,
              itemBuilder: (context, index) {
                final serveur = serveurs[index];
                return Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(vertical: 8),
                  child: ListTile(
                    contentPadding: EdgeInsets.all(16),
                    leading: Icon(Icons.person, size: 50, color: Colors.orange),
                    title: Text(
                      serveur.name,
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text('Email: ${serveur.email}'),
                    trailing: IconButton(
                      icon: Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        _showDeleteConfirmationDialog(context, serveur);
                      },
                    ),
                    onTap: () {
                      // Logique pour afficher les détails du serveur
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _showDeleteConfirmationDialog(BuildContext context, User serveur) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirmation'),
          content: Text('Êtes-vous sûr de vouloir supprimer ${serveur.name} ?'),
          actions: [
            TextButton(
              child: Text('Annuler'),
              onPressed: () {
                Navigator.of(context).pop(); // Ferme la boîte de dialogue
              },
            ),
            TextButton(
              child: Text('Supprimer'),
              onPressed: () {
                // Logique de suppression du serveur
                Navigator.of(context).pop(); // Ferme la boîte de dialogue
              },
            ),
          ],
        );
      },
    );
  }
}
