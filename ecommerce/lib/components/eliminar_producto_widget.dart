import 'package:flutter/material.dart';
import 'package:ecommerce/services/firestore_productos.dart';


Future<void> alertEliminarProducto(BuildContext context, String id, String name) async {
  showDialog(
    context: context,
    builder:  (context) {
      return AlertDialog(
        title: const Text('¿Esta seguro de eliminar este Producto?'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [Text('Nombre: $name')],
        ),
        actions: [
          ElevatedButton(
            onPressed: () async {
              await deleteProducto(id).then((value) => Navigator.pop(context));
            },
            child: const Text('Eliminar'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Cancelar'),
          )
        ],
      );
    },
  );
}