import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../Config.dart';

class AuthViewModel extends ChangeNotifier {
  static const String ROLE_CLIENT = 'CLIENT';
  static const String ROLE_SERVEUR = 'SERVEUR';
  static const String ROLE_ADMIN = 'ADMIN';

  String _email = '';
  String _password = '';
  String _role = '';Future<void> login(String email, String password) async {
    final url = Uri.parse('${Config.apiUrl}/authenticate');

    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode({
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      _email = email;
      _password = password;
      _role = data['role'] ?? ROLE_CLIENT;

      print('Received role: $_role'); // Ajoute ce print pour déboguer
      notifyListeners();
    }

  }


  // Register method
  Future<void> register(String email, String password, String role) async {
    final url = Uri.parse('${Config.apiUrl}/signup');

    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode({
        'email': email,
        'password': password,
        'role': ROLE_CLIENT,  // Specify the role here
      }),
    );

    if (response.statusCode == 201) {
      // Registration successful, you can automatically log in the user or navigate to login screen
      await login(email, password);
    } else {
      throw Exception('Failed to register');
    }
  }

  // Getter for role
  String get role => _role;

  // Logout method (optional)
  void logout() {
    _email = '';
    _password = '';
    _role = '';
    notifyListeners();
  }


}
