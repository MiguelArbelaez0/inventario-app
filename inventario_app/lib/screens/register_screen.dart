import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/user_provider.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade600,
      appBar: AppBar(title: Text('Registro')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Center(
          child: Container(
            width: 300,
            child: Form(
              key: _formKey,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      TextFormField(
                        controller: _firstNameController,
                        decoration: InputDecoration(labelText: 'Nombre'),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Ingrese un nombre';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        controller: _lastNameController,
                        decoration: InputDecoration(labelText: 'Apellido'),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Ingrese un apellido';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        controller: _emailController,
                        decoration:
                            InputDecoration(labelText: 'Correo electrónico'),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Ingrese un correo electrónico';
                          }
                          if (!value!.contains('@')) {
                            return 'Ingrese un correo electrónico válido';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        controller: _passwordController,
                        decoration: InputDecoration(labelText: 'Contraseña'),
                        obscureText: true,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Ingrese una contraseña';
                          }
                          if (value!.length < 4) {
                            return 'La contraseña debe tener al menos 6 caracteres';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 16),
                      ElevatedButton(
                        child: Text('Registrarse'),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            final userProvider = Provider.of<UserProvider>(
                                context,
                                listen: false);
                            userProvider.registerUser(
                              name: _firstNameController.text,
                              lastName: _lastNameController.text,
                              email: _emailController.text,
                              password: _passwordController.text,
                            );
                            Navigator.pushReplacementNamed(context, 'login');
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
