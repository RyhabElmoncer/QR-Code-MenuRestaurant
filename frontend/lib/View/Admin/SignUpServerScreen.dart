import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../Auth/Authviewmodel.dart'; // Assurez-vous que ce fichier est importé correctement

class SignUpServerScreen extends StatefulWidget {
  @override
  _SignUpServerScreenState createState() => _SignUpServerScreenState();
}

class _SignUpServerScreenState extends State<SignUpServerScreen> {
  final _formKey = GlobalKey<FormState>();
  String _address = '';
  String _password = '';
  String _role = 'SERVER'; // Rôle par défaut

  // Déclaration du contrôleur pour le mot de passe
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _passwordController.dispose(); // Dispose du contrôleur de texte
    super.dispose();
  }

  void _submit() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      try {
        final authViewModel = context.read<AuthViewModel>();
       // await authViewModel.signUpServer(_address, _password, _role);
        Navigator.pop(context); // Ferme la page après l'inscription
      } catch (e) {
        // Gérer les erreurs d'inscription
        print(e);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up Server'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Address'),
                onSaved: (value) => _address = value!,
                validator: (value) => value!.isEmpty ? 'Enter address' : null,
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
                onSaved: (value) => _password = value!,
                validator: (value) => value!.isEmpty ? 'Enter password' : null,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submit,
                child: Text('Sign Up'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
