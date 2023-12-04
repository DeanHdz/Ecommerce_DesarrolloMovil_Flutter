import 'package:ecommerce/services/firestore_productos.dart';
import 'package:flutter/material.dart';

Future<void> alertAgregarProducto(BuildContext context) async {
  TextEditingController nameController = TextEditingController(text: '');
  TextEditingController priceController = TextEditingController(text: '');
  TextEditingController descriptionController = TextEditingController(text: '');
  TextEditingController imageController = TextEditingController(text: '');
  await showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Agregar Producto'),
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
                await addProducto(nameController.text, priceController.text, descriptionController.text,imageController.text).then((_){
                  Navigator.of(context).pop();
                });
              }
            },
            child: const Text('Agregar'),
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