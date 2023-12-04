import 'package:flutter/material.dart';
import 'package:ecommerce/services/firestore_productos.dart';
import 'package:ecommerce/components/actualizar_producto_widget.dart';
import 'package:ecommerce/components/eliminar_producto_widget.dart';
import 'package:ecommerce/components/agregar_producto_widget.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key});

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Catálogo de productos'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:[
          Expanded(
            flex: 1,
            child: FutureBuilder(future: getProductos(), builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data?.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(snapshot.data?[index]['Nombre']),
                      subtitle: Text(snapshot.data?[index]['Descripcion']),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ActionChip(
                            label: const Icon(Icons.edit),
                            onPressed: () async {
                              await alertActualizarProducto(context, snapshot.data?[index]['id'], snapshot.data?[index]['Nombre'], snapshot.data?[index]['Precio'], snapshot.data?[index]['Descripcion'], snapshot.data?[index]['Imagen']).then((value) => setState(() {}));
                            },
                          ),
                          const SizedBox(width: 8),
                          ActionChip(
                            label: const Icon(Icons.delete),
                            onPressed: () async {
                              await alertEliminarProducto(context, snapshot.data?[index]['id'], snapshot.data?[index]['Nombre']).then((value) => setState(() {}));
                            },
                          ),
                        ],
                      ),
                    );
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
      floatingActionButton:  FloatingActionButton(
        onPressed:() async {
          await alertAgregarProducto(context).then((value) => setState(() {}));
        },
        child: const Icon(Icons.add)
      ),
    );
  }
}