import 'package:ecommerce/components/product_tile.dart';
import 'package:ecommerce/models/product.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final List<Product> products;

  const HomePage({Key? key, required this.products}) : super(key: key);

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
        title: const Text("Tienda"),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: ListView(
        children: [
          const SizedBox(height: 25),
          //Subtitulo de tienda
          Center(
            child: Text(
              "Elige del siguiente listado de productos",
              style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary),
            ),
          ),
          //Lista de productos
          SizedBox(
            height: 550,
            child: ListView.builder(
              itemCount: widget.products.length,
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.all(15),
              itemBuilder: (context, index) {
                // agarra cada producto individual de la tienda
                final product = widget.products[index];

                // Retorna la vista del producto individual
                return ProductTile(product: product);
              },
            ),
          ),
        ],
      ),
    );
  }
}
