import 'package:flutter/material.dart';

class ConfigurationScreen extends StatefulWidget {
  @override
  _ConfigurationScreenState createState() => _ConfigurationScreenState();
}

class _ConfigurationScreenState extends State<ConfigurationScreen> {
  bool _notificationsEnabled = true;
  String _selectedTheme = 'Clair';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Configuration'),
        backgroundColor: Colors.white,
      ),
      body: Stack(
        children: [
          // Image de fond
          Positioned.fill(
            child: Image.asset(
              'assets/back.png', // Remplacez par le chemin de votre image de fond
              fit: BoxFit.cover,
            ),
          ),
          // Contenu de la page

          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView(
              children: [
                SizedBox(height: 100),
                _buildNotificationSwitch(),
                SizedBox(height: 36),
                _buildThemeDropdown(),
                SizedBox(height: 24),
                _buildSaveButton(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNotificationSwitch() {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Icon(
          Icons.notifications,
          color: Colors.orange,
        ),
        title: Text('Activer les Notifications'),
        trailing: Switch(
          value: _notificationsEnabled,
          onChanged: (bool value) {
            setState(() {
              _notificationsEnabled = value;
            });
          },
          activeColor: Colors.orange,
        ),
      ),
    );
  }

  Widget _buildThemeDropdown() {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Icon(
              Icons.brightness_4,
              color: Colors.orange,
            ),
            SizedBox(width: 16),
            Expanded(
              child: Text(
                'Choisir le Thème',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            DropdownButton<String>(
              value: _selectedTheme,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedTheme = newValue!;
                });
              },
              items: <String>['Clair', 'Sombre']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              icon: Icon(
                Icons.arrow_drop_down,
                color: Colors.orange,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSaveButton() {
    return ElevatedButton(
      onPressed: () {
        // Logique pour enregistrer les paramètres de configuration
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.orange,
        padding: EdgeInsets.symmetric(vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Text(
        'Enregistrer',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}
