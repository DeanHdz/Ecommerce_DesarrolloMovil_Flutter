import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
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
                          'Registro de cuenta nueva',
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
                          labelText: 'Nombre de usuario',
                          hintText: 'Ingresar nombre de usuario',
                        ),
                      ),

                      SizedBox(height: 16.0), // Spacer

                      // Contraseña
                      TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Ingresar contraseña',
                          hintText: 'Contraseña',
                        ),
                      ),

                      SizedBox(height: 16.0), // Spacer

                      // Contraseña verificacion
                      TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Ingresar contraseña nuevamente',
                          hintText: 'Contraseña',
                        ),
                      ),

                      SizedBox(height: 24.0), // Spacer
                      // Boton crear cuenta
                      ElevatedButton(
                        onPressed: () {
                          // Logica registro de cuenta (firebase)
                        },
                        child: Text(
                          'Crear cuenta',
                          style: TextStyle(
                              color: Color.fromRGBO(248, 248, 248, 1)),
                        ),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromRGBO(174, 0, 0, 1)),
                      ),

                      SizedBox(height: 24.0), // Spacer
                      // Boton cancelar
                      ElevatedButton(
                        onPressed: () {
                          //Regresar a pagina login
                        },
                        child: Text(
                          'Cancelar',
                          style:
                              TextStyle(color: Color.fromRGBO(31, 31, 41, 1)),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Color.fromRGBO(248, 248, 248, 1),
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              color: Color.fromRGBO(174, 0, 0, 1),
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(16.0),
                          ),
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
