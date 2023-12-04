import 'package:ecommerce/services/firestore_productos.dart';
import 'package:flutter/material.dart';

Future<void> alertActualizarProducto(BuildContext context, String id, String name, String price, String description, String image) async {
  TextEditingController nameController = TextEditingController(text: name);
  TextEditingController priceController = TextEditingController(text: price);
  TextEditingController descriptionController = TextEditingController(text: description);
  TextEditingController imageController = TextEditingController(text: image);
  await showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Actualizar Producto'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'Nombre del producto:'),
            ),
            TextField(
              controller: priceController,
              decoration: const InputDecoration(labelText: 'Precio:'),
            ),
            TextField(
              controller: descriptionController,
              decoration: const InputDecoration(labelText: 'Descripción:'),
            ),
            TextField(
              controller: imageController,
              decoration: const InputDecoration(labelText: 'Imagen:'),
            )
          ],
        ),
        actions: <Widget>[
          ElevatedButton(
            onPressed: () async {
              if (nameController.text.isNotEmpty && priceController.text.isNotEmpty && descriptionController.text.isNotEmpty && imageController.text.isNotEmpty) {
                await updateProducto(id, nameController.text, priceController.text, descriptionController.text, imageController.text).then((_){
                  Navigator.of(context).pop();
                });
              }
            },
            child: const Text('Actualizar'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Cancelar'),
          ),
        ],
      );
    },
  );
}