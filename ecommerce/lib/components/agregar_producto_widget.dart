import 'dart:io';
import 'package:ecommerce/services/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/services/firestore_products.dart';
import 'package:ecommerce/services/select_image.dart';

class AgregarProductoAlertDialog extends StatefulWidget {
  const AgregarProductoAlertDialog({super.key});

  @override
  AgregarProductoAlertDialogState createState() => AgregarProductoAlertDialogState();
}

class AgregarProductoAlertDialogState extends State<AgregarProductoAlertDialog> {
  TextEditingController nameController = TextEditingController(text: '');
  TextEditingController priceController = TextEditingController(text: '');
  TextEditingController descriptionController = TextEditingController(text: '');
  String? path;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Agregar Producto'),
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
                      path = selectedPath;
                    });
                  }
                },
                child: const Text('Seleccionar imagen'),
              ),
            ),
            path != null ? Container(
                padding: const EdgeInsets.all(8.0),
                child: Image.file(File(path!)),
              ) : const Text('No se seleccionó ninguna imagen')
          ],
        ),
      ),
      actions: <Widget>[
        ElevatedButton(
          onPressed: () async {
            if (nameController.text.isNotEmpty && priceController.text.isNotEmpty && descriptionController.text.isNotEmpty && path != null) {
              await uploadFile(path!).then((value) => path = value);
              await addProducto(nameController.text, priceController.text, descriptionController.text, path!).then((_) {
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
  }
}

Future<void> alertAgregarProducto(BuildContext context) async {
  await showDialog(
    context: context,
    builder: (context) {
      return const AgregarProductoAlertDialog();
    },
  );
}