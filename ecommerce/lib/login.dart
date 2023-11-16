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
      appBar: AppBar(),
      body: Center(
        child: Container(
          color: Color.fromRGBO(174, 0, 0, 1),
          child: Column(
            children: [
              Padding(
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
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(100.0),
                      bottomRight: Radius.circular(100.0),
                    ),
                    color: Color.fromRGBO(248, 248, 248, 1),
                  ),
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.all(40.0),
                        child: Text(
                          'Inicio de sesión',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24.0,
                          ),
                        ),
                      ),

                      SizedBox(height: 24.0), // Spacer

                      // Usuario
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'Username',
                          hintText: 'Enter your username',
                        ),
                      ),

                      SizedBox(height: 16.0), // Spacer

                      // Contraseña
                      TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          hintText: 'Enter your password',
                        ),
                      ),

                      SizedBox(height: 24.0), // Spacer
                      // Login Button
                      ElevatedButton(
                        onPressed: () {
                          // Handle login logic here
                        },
                        child: Text('Ingresar'),
                      ),

                      SizedBox(height: 24.0), // Spacer
                      // Register Button
                      ElevatedButton(
                        onPressed: () {
                          // Handle login logic here
                        },
                        child: Text('Registrarte'),
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
