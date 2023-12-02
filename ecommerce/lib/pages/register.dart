import 'package:ecommerce/pageControl.dart';
import 'package:ecommerce/pages/login.dart';
import 'package:ecommerce/pages/home.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController user = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController passVerify = TextEditingController();

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
                MaterialPageRoute(builder: (context) => const PageControl()),
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
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        margin: const EdgeInsets.all(40.0),
                        child: const Text(
                          'Registro de cuenta nueva',
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
                          labelText: 'Nombre de usuario',
                          hintText: 'Ingresar nombre de usuario',
                        ),
                      ),

                      const SizedBox(height: 16.0), // Spacer

                      // Contraseña
                      TextField(
                        controller: pass,
                        obscureText: true,
                        decoration: const InputDecoration(
                          labelText: 'Ingresar contraseña',
                          hintText: 'Contraseña',
                        ),
                      ),

                      const SizedBox(height: 16.0), // Spacer

                      // Contraseña verificacion
                      TextField(
                        controller: passVerify,
                        obscureText: true,
                        decoration: const InputDecoration(
                          labelText: 'Ingresar contraseña nuevamente',
                          hintText: 'Contraseña',
                        ),
                      ),

                      const SizedBox(height: 24.0), // Spacer

                      // Boton crear cuenta
                      ElevatedButton(
                        onPressed: () {
                          // Logica registro de cuenta (firebase)
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

                      const SizedBox(height: 24.0), // Spacer

                      // Boton cancelar
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
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void registerButton() {
    if (pass != passVerify) {
      showAlertDialog(context, 'Contraseñas no coinciden',
          'Asegurate de que coincidan ambos campos de contraseña');
    }

    //(Dean) Implementar creación de usuario en firebase, cuando se crea exitosamente redirigir a pagina de home con sesión iniciado
  }

  void cancelarButton() {
    //Regresar a pagina login
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const Login()),
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
