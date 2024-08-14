import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    // Configuration de l'AnimationController pour animer les cercles
    _controller = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);

    // Animation de l'échelle du cercle
    _animation = Tween<double>(begin: 0.5, end: 1.5).animate(_controller);

    // Naviguer vers l'écran d'authentification après un délai
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, '/AuthScreen');
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          // Image de fond en haut à droite

          // Cercles animés au centre de l'écran
          Center(
            child: AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    _buildAnimatedCircle(Colors.deepOrange, 80),
                    _buildAnimatedCircle(Colors.black12, 120),
                    _buildAnimatedCircle(Colors.orangeAccent, 160),
                    // Message au centre
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAnimatedCircle(Color color, double size) {
    return Opacity(
      opacity: 0.7,
      child: Transform.scale(
        scale: _animation.value,
        child: Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
          ),
        ),
      ),
    );
  }
}
