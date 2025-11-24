import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:recipe_app/repository/ImageService.dart';

class ImageModification extends ImageService {
  final ImagePicker _picker = ImagePicker();
  File? pickedImage; // access files

  @override
  Future<File?> pickImagedFromGallery()  async {

    final XFile? file = await _picker.pickImage(
      source: ImageSource.gallery,
    );
    if(file == null) {
      return null;
    }
    return (File(file.path));
  }
}




