import 'package:flutter/material.dart';
import 'dart:math' as math;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggle() {
    if (_controller.isDismissed) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Semi-Circle Menu'),
      ),
      body: Center(
        child: Text('Press the button below!'),
      ),
      floatingActionButton: Stack(
        alignment: Alignment.bottomRight,
        children: [
          _buildFloatingButton(0, Icons.nightlight_round, 'Night Mode', Colors.purple),
          _buildFloatingButton(1, Icons.share, 'Share', Colors.purple),
          _buildFloatingButton(2, Icons.person, 'Profile', Colors.purple),
          _buildFloatingButton(3, Icons.phone, 'Call', Colors.purple),
          FloatingActionButton(
            backgroundColor: Colors.purple,
            onPressed: _toggle,
            child: AnimatedIcon(
              icon: AnimatedIcons.menu_close,
              progress: _animation,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFloatingButton(int index, IconData icon, String tooltip, Color color) {
    final double radian = index * math.pi / 4;
    final double offsetX = (100.0 * _animation.value) * math.cos(radian);
    final double offsetY = (100.0 * _animation.value) * math.sin(radian);

    return Positioned(
      right: 4.0 + offsetX,
      bottom: 4.0 + offsetY,
      child: Opacity(
        opacity: _animation.value,
        child: FloatingActionButton(
          backgroundColor: color,
          onPressed: () => print('$tooltip tapped'),
          child: Icon(icon),
          tooltip: tooltip,
        ),
      ),
    );
  }
}
