import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Simuler un délai de 2 secondes pour l'écran de démarrage
    Future.delayed(Duration(seconds: 40), () {
      Navigator.pushReplacementNamed(context, 'Onboarding3');
    });

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background.jpg'), // Remplacez par le chemin de votre image
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Text(
            'Bienvenu',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white, // Vous pouvez ajuster la couleur du texte pour le contraste
            ),
          ),
        ),
      ),
    );
  }
}
