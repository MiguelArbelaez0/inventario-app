import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/user_data_model.dart';
import '../provider/auth_provider.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  String? _errorMessage;

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (_errorMessage != null)
                Text(
                  _errorMessage!,
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              TextField(
                controller: _firstNameController,
                decoration: InputDecoration(
                  labelText: 'First Name',
                ),
              ),
              TextField(
                controller: _lastNameController,
                decoration: InputDecoration(
                  labelText: 'Last Name',
                ),
              ),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                ),
              ),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  final firstName = _firstNameController.text.trim();
                  final lastName = _lastNameController.text.trim();
                  final email = _emailController.text.trim();
                  final password = _passwordController.text.trim();

                  try {
                    await userProvider.register(
                      firstName,
                      lastName,
                      email,
                      password,
                    );

                    Navigator.pushReplacementNamed(context, 'login');
                  } catch (e) {
                    setState(() {
                      _errorMessage = 'Failed to register user';
                    });
                  }
                },
                child: Text('Register'),
              ),
              SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, 'login');
                },
                child: Text('Already have an account? Log in here'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
