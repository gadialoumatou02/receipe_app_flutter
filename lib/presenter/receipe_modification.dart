import 'dart:io';

import 'package:recipe_app/data/receipe.dart';
import 'package:image_picker/image_picker.dart';

class RecipeModification {
  final Receipe recipe;
  final ImagePicker _picker = ImagePicker();

  int serving;
  File? pickedImage; // access files

  RecipeModification(this.recipe) : serving = recipe.serving;

  // Function increase serving
  void increaseServing() {
    serving++;
  }

  // Function decrease serving
  void decreaseServing() {
    if(serving > 0) serving--;
  }

  // Function modify image
  Future<void> pickNewImage() async {
    final XFile? file = await _picker.pickImage(
        source: ImageSource.gallery,
    );
    pickedImage = File(file!.path);
  }
}