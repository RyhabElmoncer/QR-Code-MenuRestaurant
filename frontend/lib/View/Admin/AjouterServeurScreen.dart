import 'package:flutter/material.dart';

class AjouterServeurScreen extends StatefulWidget {
  @override
  _AjouterServeurScreenState createState() => _AjouterServeurScreenState();
}

class _AjouterServeurScreenState extends State<AjouterServeurScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ajouter Serveur'),
        backgroundColor: Colors.orange,
      ),
      body: Stack(
        children: [
          // Image d'arrière-plan
          Positioned.fill(
            child: Image.asset(
              'assets/background.jpg', // Assurez-vous d'avoir une image dans le dossier assets
              fit: BoxFit.cover,
            ),
          ),
          // Contenu de la page avec un fond blanc semi-transparent
          Center(
            child: Container(
              padding: const EdgeInsets.all(16.0),
              margin: const EdgeInsets.symmetric(horizontal: 20.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Image de serveur dans le formulaire
                  Image.asset(
                    'assets/Serveur.jpg', // Assurez-vous d'avoir l'image dans le dossier assets
                    width: 100,
                    height: 100,
                  ),
                  SizedBox(height: 16),
                  Text(
                    ' Nouveau Serveur',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.orangeAccent,
                    ),
                  ),
                  SizedBox(height: 16),
                  _buildTextField(
                    controller: _emailController,
                    label: 'Email',
                    icon: Icons.email,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(height: 16),
                  _buildTextField(
                    controller: _passwordController,
                    label: 'Mot de Passe',
                    icon: Icons.lock,
                    obscureText: true,
                  ),
                  SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () {
                      // Logique pour ajouter un serveur
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange, // Couleur de fond du bouton
                      padding: EdgeInsets.symmetric(vertical: 24), // Espacement vertical
                      minimumSize: Size(double.infinity, 50), // Largeur minimale et hauteur
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      'Ajouter',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white, // Couleur du texte du bouton
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    bool obscureText = false,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: Colors.orange),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      obscureText: obscureText,
      keyboardType: keyboardType,
    );
  }
}
