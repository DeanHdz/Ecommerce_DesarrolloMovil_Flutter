import 'package:ecommerce/models/shop.dart';
import 'package:ecommerce/models/user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    //Obtener usuario
    late User user = context.watch<Shop>().user;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          foregroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Proceso de pago"),
              Text(
                user.id == null
                    ? "Vista de invitado"
                    : "Bienvenido, ${user.name}!",
                style: const TextStyle(fontSize: 12),
              )
            ],
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.background);
  }
}
