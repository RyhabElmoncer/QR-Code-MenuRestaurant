import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../Auth/Authviewmodel.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> with SingleTickerProviderStateMixin {
  bool _isObscurePassword = true;
  bool _isObscureConfirmPassword = true;
  late AnimationController _animationController;
  late Animation<double> _buttonAnimation;

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  final _formKey = GlobalKey<FormState>(); // Key for form validation

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
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Form(
              key: _formKey, // Use the form key for validation
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    'assets/télécharger.jpg', // Chemin de ton image locale
                    height: 150,
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Sign Up',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange,
                    ),
                  ),
                  SizedBox(height: 20),
                  _buildTextField(
                    controller: _emailController,
                    labelText: 'Email',
                    obscureText: false,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 10),
                  _buildTextField(
                    controller: _passwordController,
                    labelText: 'Password',
                    obscureText: _isObscurePassword,
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isObscurePassword ? Icons.visibility_off : Icons.visibility,
                        color: Colors.orange[900],
                      ),
                      onPressed: () {
                        setState(() {
                          _isObscurePassword = !_isObscurePassword;
                        });
                      },
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      if (value.length < 6) {
                        return 'Password must be at least 6 characters long';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 10),
                  _buildTextField(
                    controller: _confirmPasswordController,
                    labelText: 'Confirm Password',
                    obscureText: _isObscureConfirmPassword,
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isObscureConfirmPassword ? Icons.visibility_off : Icons.visibility,
                        color: Colors.orange[900],
                      ),
                      onPressed: () {
                        setState(() {
                          _isObscureConfirmPassword = !_isObscureConfirmPassword;
                        });
                      },
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please confirm your password';
                      }
                      if (value != _passwordController.text) {
                        return 'Passwords do not match';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  ScaleTransition(
                    scale: _buttonAnimation,
                    child: ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState?.validate() ?? false) {
                          final email = _emailController.text.trim();
                          final password = _passwordController.text.trim();

                          try {
                            final authViewModel = context.read<AuthViewModel>();
                            await authViewModel.register(
                              email,
                              password,
                              AuthViewModel.ROLE_CLIENT, // Registering as a CLIENT by default
                            );

                            // Redirect user to client page after successful registration
                            Navigator.pushReplacementNamed(context, '/QRScanPage');
                          } catch (e) {
                            // Handle registration errors
                            print(e);
                          }
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        'Sign Up',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String labelText,
    required bool obscureText,
    Widget? suffixIcon,
    required FormFieldValidator<String> validator,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.orange, width: 2), // Add border
      ),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: TextStyle(color: Colors.orange[900]),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          suffixIcon: suffixIcon,
        ),
        validator: validator,
      ),
    );
  }
}
