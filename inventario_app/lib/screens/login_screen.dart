import 'package:flutter/material.dart';
import 'package:inventario_app/screens/home_screen.dart';
import 'package:provider/provider.dart';

import '../provider/user_provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();

  final _passwordController = TextEditingController();

  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      backgroundColor: Colors.blue.shade600,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextFormField(
                          controller: _emailController,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.blue),
                            ),
                            hintText: "Email",
                            // hintStyle: TextStyle(color: Colors.white),
                            prefixIcon: Icon(Icons.email),
                            labelText: 'Email',
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor ingresa tu correo electrónico';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: _passwordController,
                          obscureText: _obscureText,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor ingresa tu contraseña';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.emailAddress,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              // borderSide: BorderSide(color: Colors.black),
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(_obscureText
                                  ? Icons.visibility_off
                                  : Icons.visibility),
                              onPressed: () {
                                setState(() {
                                  _obscureText = !_obscureText;
                                });
                              },
                            ),
                            hintText: "Contraseña",
                            // hintStyle: TextStyle(color: Colors.white),
                            prefixIcon: Icon(Icons.password),
                            labelText: 'Contraseña',
                          ),
                        ),
                        SizedBox(height: 16.0),
                        ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll(
                                  Colors.blue.shade600)),
                          onPressed: () {
                            final isValid = _formKey.currentState!.validate();
                            if (isValid) {
                              final isUserLoggedIn = userProvider.loginUser(
                                email: _emailController.text.trim(),
                                password: _passwordController.text,
                              );
                              if (isUserLoggedIn) {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomeScreen()),
                                );
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                        'El correo electrónico o la contraseña son incorrectos.'),
                                  ),
                                );
                              }
                            }
                          },
                          child: Text('Iniciar sesión'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 16.0, bottom: 16.0),
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, 'register');
                  },
                  child: Text(
                    '¿No tienes cuenta? Regístrate aquí.',
                    style: TextStyle(
                      color: Colors.grey.shade800,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
