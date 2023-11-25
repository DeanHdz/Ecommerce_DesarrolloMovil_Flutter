/*import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

FirebaseFirestore db = FirebaseFirestore.instance;


Future<List> getUsuarios(String coleccion) async {
  List documents = [];
  QuerySnapshot queryDocuments = await db.collection(coleccion).get();
  for (var doc in queryDocuments.docs) {
    final Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    final  = {
      'id': doc.id,
      'Contraseña': data['Contraseña'],
      'Usuario': data['']
    };
    documents.add();
  }
  return documents;
}

Future<void> addUsuario(String nombre, String , String coleccion) async {
  await db.collection(coleccion).add({
    'Nombre': nombre,
    '': 
  });
}

Future<void> updateUsuario(String id, String nombre, String , String coleccion) async {
  await db.collection(coleccion).doc(id).update({
    'Nombre': nombre,
  });
}

Future<void> delete(String id, String coleccion) async {
  await db.collection(coleccion).doc(id).delete();
}*/