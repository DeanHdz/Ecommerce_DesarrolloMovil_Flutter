import 'dart:io';
import 'package:ecommerce/services/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/services/firestore_productos.dart';
import 'package:ecommerce/services/select_image.dart';

class ActualizarProductoAlertDialog extends StatefulWidget {
  final String id;
  final String name;
  final String price;
  final String description;
  final String path;

  const ActualizarProductoAlertDialog({
    super.key, 
    required this.id,
    required this.name,
    required this.price,
    required this.description,
    required this.path,
  });

  @override
  ActualizarProductoAlertDialogState createState() => ActualizarProductoAlertDialogState();
}

class ActualizarProductoAlertDialogState extends State<ActualizarProductoAlertDialog> {
  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  bool cambioImagen = false;
  late String imagePath;

  @override
  void initState() {
    super.initState();
    nameController.text = widget.name;
    priceController.text = widget.price;
    descriptionController.text = widget.description;
    imagePath = widget.path;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Actualizar Producto'),
      content: SingleChildScrollView(
        child: Column(
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () async {
                  String? selectedPath = await selectImage();
                  if (selectedPath != null) {
                    setState(() {
                      cambioImagen = true;
                      imagePath = selectedPath;
                    });
                  }
                },
                child: const Text('Seleccionar otra imagen'),
              ),
            ),
            Visibility(
              visible: cambioImagen,
              replacement: Container(
                padding: const EdgeInsets.all(8.0),
                child: Image.network(imagePath),
              ),
              child: Container(
                padding: const EdgeInsets.all(8.0),
                child: Image.file(File(imagePath)),
              ),
            )
          ],
        ),
      ),
      actions: <Widget>[
        ElevatedButton(
          onPressed: () async {
            if (nameController.text.isNotEmpty && priceController.text.isNotEmpty && descriptionController.text.isNotEmpty && imagePath.isNotEmpty) {
              if (cambioImagen) {
                await uploadFile(imagePath).then((value) => imagePath = value);
              }
              await updateProducto(widget.id, nameController.text, priceController.text, descriptionController.text, imagePath).then((_) {
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
  }
}

Future<void> alertActualizarProducto(BuildContext context, String id, String name, String price, String description, String path) async {
  await showDialog(
    context: context,
    builder: (context) {
      return ActualizarProductoAlertDialog(
        id: id,
        name: name,
        price: price,
        description: description,
        path: path,
      );
    },
  );
}
