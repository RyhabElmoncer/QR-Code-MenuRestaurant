import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../Auth/Authviewmodel.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with SingleTickerProviderStateMixin {
  bool _isObscure = true;
  late AnimationController _animationController;
  late Animation<double> _buttonAnimation;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    _buttonAnimation = Tween<double>(begin: 1.0, end: 1.1).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );

    _animationController.repeat(reverse: true);
  }

  @override
  void dispose() {
    _animationController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/img.png',
                height: 150,
              ),
              SizedBox(height: 20),
              Text(
                'Login',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange[700],
                ),
              ),
              SizedBox(height: 20),
              _buildTextField(
                controller: _emailController,
                label: 'Email',
                obscureText: false,
              ),
              SizedBox(height: 10),
              _buildTextField(
                controller: _passwordController,
                label: 'Password',
                obscureText: _isObscure,
                suffixIcon: IconButton(
                  icon: Icon(
                    _isObscure ? Icons.visibility_off : Icons.visibility,
                    color: Colors.orange[900],
                  ),
                  onPressed: () {
                    setState(() {
                      _isObscure = !_isObscure;
                    });
                  },
                ),
              ),
              SizedBox(height: 20),
              ScaleTransition(
                scale: _buttonAnimation,
                child: ElevatedButton(
                  onPressed: () async {
                    final email = _emailController.text.trim();
                    final password = _passwordController.text.trim();

                    if (email.isEmpty || password.isEmpty) {
                      print('All fields are required');
                      return;
                    }

                    try {
                      final authViewModel = context.read<AuthViewModel>();
                      await authViewModel.login(email, password);

                      if (authViewModel.role == AuthViewModel.ROLE_CLIENT) {
                        Navigator.pushReplacementNamed(context, '/QRScanPage');
                      } else if (authViewModel.role == AuthViewModel.ROLE_SERVEUR) {
                        Navigator.pushReplacementNamed(context, '/ServeurScreen');
                      } else if (authViewModel.role == AuthViewModel.ROLE_ADMIN) {
                        Navigator.pushReplacementNamed(context, '/adminScreen');
                      }
                    } catch (e) {
                      print(e);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange[700],
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    'Login',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Forgot Password',
                  style: TextStyle(color: Colors.orange),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required bool obscureText,
    Widget? suffixIcon,
  }) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.orange, width: 2),
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(color: Colors.orange[900]),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          suffixIcon: suffixIcon,
        ),
      ),
    );
  }
}
