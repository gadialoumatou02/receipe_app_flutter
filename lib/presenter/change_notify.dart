import 'package:flutter/material.dart';
import 'package:recipe_app/data/receipe.dart';

abstract class RecipePresenter extends ChangeNotifier {
  abstract List<Receipe> recipes;

  void increaseServing(Receipe recipe, int shift);
  void decreaseServing(Receipe recipe, int shift);
  void setQuantity(Receipe recipe, int qty);
  void pickNewImage(Receipe recipe);
  void setTimeCook(Receipe recipe, int time);
  void setTimePrep(Receipe recipe, int time);

}