import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

final FirebaseStorage storage = FirebaseStorage.instance;

Future<String> uploadFile(String filePath) async {
  File file = File(filePath);

  try {
    await storage.ref('productos/${file.path.split('/').last}').putFile(file);
  } on FirebaseException catch (e) {
    return e.toString();
  }
  return storage.ref('productos/${file.path.split('/').last}').getDownloadURL();
}