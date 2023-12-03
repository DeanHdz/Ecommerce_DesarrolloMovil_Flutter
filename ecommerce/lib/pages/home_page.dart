import 'package:ecommerce/components/product_tile.dart';
import 'package:ecommerce/models/product.dart';
import 'package:ecommerce/models/user.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final List<Product> products;
  final User user; //Puede o no tener una sesion de usuario actual

  const HomePage({Key? key, required this.products, required this.user})
      : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Tienda"),
            Text(
              widget.user.id == null
                  ? "Vista de invitado"
                  : "Bienvenido, ${widget.user.name}!",
              style: const TextStyle(fontSize: 12),
            )
          ],
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: ListView(
        children: [
          const SizedBox(height: 25),
          Center(
            child: Text(
              "Elige del siguiente listado de productos",
              style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary),
            ),
          ),
          // Use a SingleChildScrollView to enable horizontal and vertical scrolling
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: widget.products.map((product) {
                return ProductTile(product: product);
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
