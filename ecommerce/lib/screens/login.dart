import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Center(
        child: Container(
          color: const Color.fromRGBO(174, 0, 0, 1),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Padding(
                padding: EdgeInsets.only(
                    left: 16.0, right: 16.0, top: 50.0, bottom: 50.0),
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
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(100.0),
                      bottomRight: Radius.circular(100.0),
                    ),
                    color: Color.fromRGBO(248, 248, 248, 1),
                  ),
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.all(40.0),
                        child: const Text(
                          'Inicio de sesión',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24.0,
                          ),
                        ),
                      ),

                      const SizedBox(height: 24.0), // Spacer

                      // Usuario
                      const TextField(
                        decoration: InputDecoration(
                          labelText: 'Usuario',
                          hintText: 'Ingresar nombre de usuario',
                        ),
                      ),

                      const SizedBox(height: 16.0), // Spacer

                      // Contraseña
                      const TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Contraseña',
                          hintText: 'Ingresar contraseña',
                        ),
                      ),

                      const SizedBox(height: 24.0), // Spacer
                      // Boton login
                      ElevatedButton(
                        onPressed: () {
                          // Logica login
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: const Color.fromRGBO(174, 0, 0, 1)),
                        child: const Text(
                          'Ingresar',
                          style: TextStyle(
                              color: Color.fromRGBO(248, 248, 248, 1)),
                        ),
                      ),

                      const SizedBox(height: 24.0), // Spacer
                      // Boton registro
                      ElevatedButton(
                        onPressed: () {
                          // Logica registro
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromRGBO(248, 248, 248, 1),
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(
                              color: Color.fromRGBO(174, 0, 0, 1),
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                        ),
                        child: const Text(
                          'Registrarte',
                          style:
                              TextStyle(color: Color.fromRGBO(31, 31, 41, 1)),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
