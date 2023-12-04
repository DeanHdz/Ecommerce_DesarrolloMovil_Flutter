import 'package:image_picker/image_picker.dart';

Future<String?> selectImage() async {
  final picker = ImagePicker();
  final pickedFile = await picker.pickImage(source: ImageSource.gallery);
  if (pickedFile != null) {
    return pickedFile.path;
  }else{
    return null;
  }
}