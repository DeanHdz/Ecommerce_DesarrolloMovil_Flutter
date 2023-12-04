import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

Future<List> getProductos() async {
  List documents = [];
  QuerySnapshot queryDocuments = await db.collection('Productos').get();
  for (var doc in queryDocuments.docs) {
    final Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    final producto = {
      'id': doc.id,
      'Nombre': data['Nombre'],
      'Precio': data['Precio'],
      'Descripcion': data['Descripcion'],
      'Imagen': data['Imagen']
    };
    documents.add(producto);
  }
  return documents;
}

Future<void> addProducto(String nombre, double precio, String descripcion, String imagen) async {
  await db.collection('Productos').add({
    'Nombre': nombre,
    'Precio': precio,
    'Descripcion': descripcion,
    'Imagen': imagen
  });
}

Future<void> updateProducto(String id, String nombre, double precio, String descripcion, String imagen) async {
  await db.collection('Productos').doc(id).update({
    'Nombre': nombre,
    'Precio': precio,
    'Descripcion': descripcion,
    'Imagen': imagen
  });
}

Future<void> deleteProducto(String id) async {
  await db.collection('Productos').doc(id).delete();
}