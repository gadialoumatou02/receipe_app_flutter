import 'dart:io';

import 'package:recipe_app/data/receipe.dart';
import 'package:image_picker/image_picker.dart';

class RecipeModification {
  final Receipe recipe;
  final ImagePicker _picker = ImagePicker();

  int serving;
  int time_prep;
  int time_cook;
  List ingredients;
  File? pickedImage; // access files

  RecipeModification(this.recipe) :
        serving = recipe.serving,
        time_prep = recipe.time_prep,
        time_cook = recipe.time_cook,
        ingredients = recipe.ingred_list;

  // Function increase serving
  void increaseServing() {
    serving++;
  }

  // Function decrease serving
  void decreaseServing() {
    if(serving > 0) serving--;
  }

  // Fonction de tri
  void sortByName(){
    ingredients.sort((a,b) =>
        a['name'].toLowerCase().compareTo(b['name'].toLowerCase()));
  }
  // Remove ingredient
  void removeIngredient(int index) {
      ingredients.removeAt(index);
  }
  // Function modify image
  Future<void> pickNewImage() async {
    final XFile? file = await _picker.pickImage(
        source: ImageSource.gallery,
    );
    pickedImage = File(file!.path);
  }
}