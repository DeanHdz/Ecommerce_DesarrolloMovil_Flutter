import 'package:ecommerce/pages/register.dart';
import 'package:ecommerce/pages/home.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController user = TextEditingController();
  TextEditingController pass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // No back button in the AppBar
        automaticallyImplyLeading: false,
        backgroundColor: const Color.fromRGBO(174, 0, 0, 1),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.home,
              color: Colors.white,
              size: 40.0,
            ),
            onPressed: () {
              //Ir a pagina de registro
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const Home()),
              );
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
                      TextField(
                        controller: user,
                        decoration: const InputDecoration(
                          labelText: 'Usuario',
                          hintText: 'Ingresar nombre de usuario',
                        ),
                      ),

                      const SizedBox(height: 16.0), // Spacer

                      // Contraseña
                      TextField(
                        controller: pass,
                        obscureText: true,
                        decoration: const InputDecoration(
                          labelText: 'Contraseña',
                          hintText: 'Ingresar contraseña',
                        ),
                      ),

                      const SizedBox(height: 24.0), // Spacer

                      // Boton login
                      ElevatedButton(
                        onPressed: () {
                          loginButton();
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromRGBO(174, 0, 0, 1)),
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
                          registerButton();
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

  void loginButton() {
    //(Dean) Implementar consulta de cuenta en firebase, usar showAlertDialog para errores
  }

  void registerButton() {
    //Ir a pagina de registro
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const Register()),
    );
  }
}

void showAlertDialog(BuildContext context, String title, String content) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: <Widget>[
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('OK'),
          ),
        ],
      );
    },
  );
}
