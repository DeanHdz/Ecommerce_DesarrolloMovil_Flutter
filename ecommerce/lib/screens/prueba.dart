
import 'package:ecommerce/components/product_tile_widget.dart';
import 'package:ecommerce/models/producto.dart';
import 'package:ecommerce/services/firestore.dart';
import 'package:flutter/material.dart';

class Consultar extends StatefulWidget {
  const Consultar({super.key});

  @override
  State<Consultar> createState() => _HomeState();
}

class _HomeState extends State<Consultar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Productos')
      ),
      body:Column(
        children:[
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