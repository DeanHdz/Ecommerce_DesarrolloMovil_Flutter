import 'package:ecommerce/services/firebase_authentication.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final FirebaseAuthService _firebaseAuthService = FirebaseAuthService();

  TextEditingController user = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController passVerify = TextEditingController();

  @override
  void dispose() {
    user.dispose();
    email.dispose();
    pass.dispose();
    passVerify.dispose();
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
            icon: const Icon(
              Icons.home,
              color: Colors.white,
              size: 32.0,
            ),
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
            mainAxisSize: MainAxisSize.min,
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
                            'Registro de cuenta nueva',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24.0,
                            ),
                          ),
                        ),
                        TextField(
                          controller: user,
                          decoration: const InputDecoration(
                            labelText: 'Nombre de usuario',
                            hintText: 'Elija un nombre de usuario',
                          ),
                        ),
                        const SizedBox(height: 16.0),
                        TextField(
                          controller: email,
                          decoration: const InputDecoration(
                            labelText: 'Ingresar correo electrónico',
                            hintText: 'Correo electrónico',
                          ),
                        ),
                        TextField(
                          controller: pass,
                          obscureText: true,
                          decoration: const InputDecoration(
                            labelText: 'Ingresar contraseña',
                            hintText: 'Contraseña',
                          ),
                        ),
                        TextField(
                          controller: passVerify,
                          obscureText: true,
                          decoration: const InputDecoration(
                            labelText: 'Ingresar contraseña nuevamente',
                            hintText: 'Contraseña',
                          ),
                        ),
                        const SizedBox(height: 16.0),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                if (user.text.isNotEmpty && email.text.isNotEmpty && pass.text.isNotEmpty && passVerify.text.isNotEmpty){
                                  crearCuenta();
                                } else {
                                  _showErrorDialog('Por favor, llene todos los campos');
                                }                                
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      const Color.fromRGBO(174, 0, 0, 1)),
                              child: const Text(
                                'Crear cuenta',
                                style: TextStyle(
                                    color: Color.fromRGBO(248, 248, 248, 1)),
                              ),
                            ),
                            const SizedBox(width: 16.0),
                            ElevatedButton(
                              onPressed: () {
                                cancelarButton();
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromRGBO(248, 248, 248, 1),
                                shape: RoundedRectangleBorder(
                                  side: const BorderSide(
                                    color: Color.fromRGBO(174, 0, 0, 1),
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(16.0),
                                ),
                              ),
                              child: const Text(
                                'Cancelar',
                                style:
                                    TextStyle(color: Color.fromRGBO(31, 31, 41, 1)),
                              ),
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

  void crearCuenta() {
    if (pass.text == passVerify.text) {
      _firebaseAuthService.createUserWithEmailAndPassword(user.text, pass.text).then((User? user) {
        if (user != null) {
          Navigator.pushReplacementNamed(context, '/pageControl');
        } else {
          _showErrorDialog('Ocurrió un error durante la creación de la cuenta');
        }
      });
    } else {
      _showErrorDialog('Las contraseñas no coinciden');
    }
  }

  void cancelarButton() {
    Navigator.pushReplacementNamed(context, '/login');
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