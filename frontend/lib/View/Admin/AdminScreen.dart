import 'package:flutter/material.dart';

class AdminScreen extends StatefulWidget {
  @override
  _AdminScreenState createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  // Remplacez ces valeurs par des appels API ou des données dynamiques
  int _numberOfServers = 10;
  int _numberOfOrders = 25;
  int _numberOfClients = 30;
  int _numberOfTables = 15; // Nouvelle variable pour le nombre de tables

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Dashboard'),
        backgroundColor: Colors.orangeAccent,
        actions: [
          CircleAvatar(
            child: Icon(Icons.person, size: 24),
            backgroundColor: Colors.white,
          ),
          SizedBox(width: 10),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text('Kousay'),
              accountEmail: Text('Kousay@gmail.com'),
              currentAccountPicture: CircleAvatar(
                child: Icon(Icons.person, size: 40),
                backgroundColor: Colors.white,
              ),
              decoration: BoxDecoration(
                color: Colors.orange,
              ),
            ),
            _buildListTile(Icons.add, 'Ajouter Serveur', '/ajouterServeur'),
            _buildListTile(Icons.list, 'Liste Serveurs', '/listeServeurs'),
            _buildListTile(Icons.bar_chart, 'Statistiques', '/adminScreen'),
            _buildListTile(Icons.menu_book, 'Liste des Menus', '/listeMenus'),
            _buildListTile(Icons.settings, 'Configuration', '/configuration'),
            _buildListTile(Icons.exit_to_app, 'Déconnexion', '/'),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildDashboardCard('Serveurs', _numberOfServers, Icons.group),
            SizedBox(height: 16),
            _buildDashboardCard('Commandes', _numberOfOrders, Icons.assignment),
            SizedBox(height: 16),
            _buildDashboardCard('Clients', _numberOfClients, Icons.person),
            SizedBox(height: 16),
            _buildDashboardCard('Tables', _numberOfTables, Icons.table_chart),
          ],
        ),
      ),
    );
  }

  Widget _buildListTile(IconData icon, String title, String route) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0), // Augmente la hauteur des éléments
      child: ListTile(
        leading: Icon(
          icon,
          size: 32, // Taille de l'icône agrandie
          color: Colors.orangeAccent, // Couleur de l'icône
        ),
        title: Text(
          title,
          style: TextStyle(
            fontSize: 20, // Taille du texte agrandie
            fontWeight: FontWeight.bold, // Met le texte en gras
          ),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 16.0), // Padding interne
        tileColor: Colors.grey[200], // Couleur de fond de l'élément
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0), // Coins arrondis
        ),
        onTap: () {
          Navigator.pushNamed(context, route);
        },
      ),
    );
  }

  Widget _buildDashboardCard(String title, int count, IconData icon) {
    return Card(
      elevation: 5,
      child: InkWell(
        onTap: () {
          // Ajoutez la logique de navigation ou d'action ici si nécessaire
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                size: 60, // Taille agrandie de l'icône
                color: Colors.blueAccent,
              ),
              SizedBox(height: 10),
              Text(
                title,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                '$count',
                style: TextStyle(fontSize: 28),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
