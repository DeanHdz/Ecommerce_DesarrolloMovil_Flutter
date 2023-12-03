import 'package:ecommerce/models/product.dart';
import 'package:ecommerce/models/shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  //remove item from cart method
  void removeItemFromCart(BuildContext context, Product product) {
    // show a dialog box to ask user to confirm to remove from cart
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: const Text("¿Quieres remover el producto a tu carrito?"),
        actions: [
          //Boton cancelar
          MaterialButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancelar"),
          ),
          //Boton SI
          MaterialButton(
            onPressed: () {
              //Mostrar dialogo
              Navigator.pop(context);
              //Remover de carrito
              context.read<Shop>().removeFromCart(product);
            },
            child: const Text("Si"),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // get access to the cart
    final cart = context.watch<Shop>().cart;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Carrito"),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cart.length,
              itemBuilder: (context, index) {
                // get individual item in cart
                final item = cart[index];

                // return as a cart tile UI
                return ListTile(
                  title: Text(item.name),
                  subtitle: Text(item.price.toStringAsFixed(2)),
                  trailing: IconButton(
                    icon: const Icon(Icons.remove),
                    onPressed: () => removeItemFromCart(context, item),
                  ),
                );
              },
            ),
          ),

          // boton para pagar
        ],
      ),
    );
  }
}
