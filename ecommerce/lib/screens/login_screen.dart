import 'package:ecommerce/services/firebase_authentication.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final FirebaseAuthService _firebaseAuthService = FirebaseAuthService();

  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  void dispose() {
    username.dispose();
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color.fromRGBO(174, 0, 0, 1),
        actions: <Widget>[
          const Text('Entrar como invitado',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
              color: Colors.white,
            ),
          ),
          IconButton(
            icon: const Icon(Icons.home, color: Colors.white, size: 32.0),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/pageControl');
            },
          ),
        ],
      ),
      body: Center(
        child: Container(
          color: const Color.fromRGBO(174, 0, 0, 1),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(
                    left: 16.0, right: 16.0, top: 20.0, bottom: 20.0),
                child: Text(
                  'SLP Express',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24.0,
                    color: Color.fromRGBO(248, 248, 248, 1),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(100.0),
                      bottomRight: Radius.circular(100.0),
                    ),
                    color: Color.fromRGBO(248, 248, 248, 1),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(16.0),
                          child: const Text(
                            'Iniciar sesión',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24.0,
                            ),
                          ),
                        ),
                        TextField(
                          controller: username,
                          decoration: const InputDecoration(
                            labelText: 'Usuario',
                            hintText: 'Elija un nombre de usuario',
                          ),
                        ),
                        const SizedBox(height: 16.0),
                        TextField(
                          controller: email,
                          decoration: const InputDecoration(
                            labelText: 'Correo electrónico',
                            hintText: 'Ingresar correo electrónico',
                          ),
                        ),
                        const SizedBox(height: 16.0),
                        TextField(
                          controller: password,
                          decoration: const InputDecoration(
                            labelText: 'Contraseña',
                            hintText: 'Ingresar contraseña',
                          ),
                        ),
                        const SizedBox(height: 16.0),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                if (username.text.isNotEmpty && email.text.isNotEmpty && password.text.isNotEmpty) {
                                  iniciarSesion();
                                } else {
                                  _showErrorDialog('Por favor, ingrese todos los datos');
                                }
                              },
                              child: const Text('Ingresar'),
                            ),
                            const SizedBox(width: 16.0),
                            ElevatedButton(
                              onPressed: () {
                                registrarse();
                              },
                              child: const Text('Crear cuenta'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  void registrarse() {
    Navigator.pushReplacementNamed(context, '/register');
  }

  void iniciarSesion() async {
    final User? user = await _firebaseAuthService.signInWithEmailAndPassword(email.text, password.text);
    if (user != null) {
      _navigateToPageControl();
    } else {
      _showErrorDialog('Usuario o contraseña incorrectos');
    }
  }

  void _navigateToPageControl() {
    Navigator.pushReplacementNamed(context, '/pageControl');
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Error'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Aceptar'),
          ),
        ],
      ),
    );
  }
}