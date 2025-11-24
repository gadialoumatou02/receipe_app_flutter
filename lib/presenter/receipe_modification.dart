import 'dart:io';

import 'package:get_it/get_it.dart';
import 'package:recipe_app/data/receipe.dart';
import 'package:image_picker/image_picker.dart';
import 'package:recipe_app/presenter/change_notify.dart';
import 'package:recipe_app/repository/receipe_repository.dart';

class RecipeModification extends RecipePresenter{
  @override
  List<Receipe> recipes = GetIt.instance<ReceipeRepository>().receipes;

  final ImagePicker _picker = ImagePicker();
  File? pickedImage; // access files


  // Function increase serving
  @override
  void increaseServing(Receipe recipe, int shift) {
    recipe.serving+= shift;
    notifyListeners();
  }

  // Function decrease serving
  void decreaseServing(Receipe recipe, int shift) {
    if(shift > 0) {
      recipe.serving += -shift;
    }
    notifyListeners();
  }
  // modif serving
  @override
  void setQuantity(Receipe recipe, int qty) {
    recipe.serving = qty;
    notifyListeners();
  }
  // modif time cook
  @override
  void setTimeCook(Receipe recipe, int time) {
    recipe.time_cook = time;
    notifyListeners();
  }
  // modif time prep
  @override
  void setTimePrep(Receipe recipe, int time) {
    recipe.time_prep = time;
    notifyListeners();
  }

  // Function modify image
  @override
  Future<void> pickNewImage(Receipe recipe) async {
    final XFile? file = await _picker.pickImage(
      source: ImageSource.gallery,
    );
    if(file == null) return;
    pickedImage = File(file.path);
    notifyListeners();
  }

  // Fonction de tri
  void sortByName(Receipe recipe){
    recipe.ingred_list.sort((a,b) =>
        a['name'].toLowerCase().compareTo(b['name'].toLowerCase()));
    notifyListeners();
  }

  // Modif ingredient qty
  void modifIngQty(Receipe recipe, int index, double qty) {
    recipe.ingred_list[index]["qty"] = qty;
    notifyListeners();
  }
  // Remove ingredient
  void removeIngredient(Receipe recipe, int index) {
      recipe.ingred_list.removeAt(index);
      notifyListeners();
  }
  // add ingredient
  void addIngredient(Receipe recipe, String name, double qty) {
    recipe.ingred_list.add({
      'name':name,
      "qty":qty,
    });
    notifyListeners();
  }




}