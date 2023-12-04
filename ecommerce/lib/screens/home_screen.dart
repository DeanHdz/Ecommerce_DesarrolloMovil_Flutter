import 'package:ecommerce/components/product_tile_widget.dart';
import 'package:ecommerce/models/producto.dart';
import 'package:ecommerce/models/user.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/services/firestore_products.dart';


class HomePage extends StatefulWidget {
  final List<Product> products;
  final User user; //Puede o no tener una sesion de usuario actual

  const HomePage({super.key, required this.products, required this.user});

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
      body: Column(
        children:[
          const SizedBox(height: 25),
          Center(
            child: Text(
              "Elige del siguiente listado de productos",
              style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary),
            ),
          ),
          Expanded(
            flex: 1,
            child: FutureBuilder(future: getProductos(), builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data?.length,
                  itemBuilder: (context, index) {
                    return ProductTile(product: Product.fromMap(snapshot.data?[index]));
                  }
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator()
                );
              }
            }),
          ),
        ]
      ),
    );
  }
}
