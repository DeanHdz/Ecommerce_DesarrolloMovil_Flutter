import 'package:ecommerce/models/shop.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  final User? currentUser = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    // get user
    final user = context.watch<Shop>().user;
    // Recuperar shop para definir usuario como invitado
    final shop = context.watch<Shop>();

    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
        //Vista de Administrador
        currentUser!.uid == "2peojaZjxUY5dTY5cdYW3U1DuAr2" ?
          Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/admin');
                  },
                  child: const Text("Ver el Catálogo de productos")),
            ),
          ) : const  SizedBox(),
        // Mostrar usuario
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Icon(Icons.person),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                user.id == null ? "Vista de invitado" : "${user.name}",
                style: const TextStyle(fontSize: 12),
              ),
            ),
          ],
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: ElevatedButton(
                onPressed: () {
                  shop.setGuestUser();
                },
                child: const Text("Cerrar sesión")),
          ),
        )
      ]),
    );
  }
}
