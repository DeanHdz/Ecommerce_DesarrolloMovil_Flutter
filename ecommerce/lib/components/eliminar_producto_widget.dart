import 'package:flutter/material.dart';
import 'package:ecommerce/services/firestore_productos.dart';

class EliminarProductoAlertDialog extends StatelessWidget {
  final String id;
  final String name;

  const EliminarProductoAlertDialog({
    super.key, 
    required this.id,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('¿Está seguro de eliminar este producto?'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
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
  }
}

Future<void> alertEliminarProducto(BuildContext context, String id, String name) async {
  await showDialog(
    context: context,
    builder:  (context) {
      return EliminarProductoAlertDialog(
        id: id,
        name: name,
      );
    },
  );
}
