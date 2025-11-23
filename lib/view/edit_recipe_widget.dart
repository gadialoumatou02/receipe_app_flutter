import 'package:flutter/material.dart';

import '../data/receipe.dart';
import '../presenter/receipe_modification.dart';
import 'ingredient_view.dart';


class EditRecipeWidget extends StatefulWidget {
  final Receipe receipe;
  final void Function(int shift) shiftServing;
  const EditRecipeWidget({super.key, required this.receipe, required this.shiftServing, });

  @override
  State<EditRecipeWidget> createState() => _EditReceipeWidgetState();
}

class _EditReceipeWidgetState extends State<EditRecipeWidget> {
  late RecipeModification modify;
  bool sortByName = false;

  // Function for state
  @override
  void initState() {
    super.initState();
    modify = RecipeModification(widget.receipe);
  }

  // Vue
  @override
  Widget build(BuildContext context) {
    final receipe = widget.receipe;
    return Scaffold(
        appBar: AppBar(
          title: Text(
              receipe.name,
              style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold
              )
          ),
        ),
        body: ListView(
            padding: const EdgeInsets.all(16.0),
            children: [
              // Temps préparation
              TextFormField(initialValue: "${modify.time_prep}"),
              const SizedBox (height: 16),
              // Time cook
              TextFormField(initialValue: "${modify.time_cook}"),
              const SizedBox (height: 16),
              // Serving
              TextFormField(initialValue: "${modify.serving}"),
              const SizedBox (height: 16),
              // Ingredients
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Ingredients",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold
                  ),
                  ),
                  const SizedBox(width: 15),
                  // Button checkbox
                  Checkbox(value: sortByName,
                      onChanged: (bool? value) {
                        setState(() {
                          sortByName == value?? false;
                          if (sortByName) {
                            modify.sortByName();
                          }
                        });
                      }),
                  Text("Sort By Name",
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold
                    ),
                  )
                ],
              ),
              const SizedBox(height: 15),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: receipe.ingred_list.length,
                itemBuilder: (context, index) {
                  final ingredient = receipe.ingred_list[index];
                  return IngredientViewWidget(ingredient: ingredient, onRemove: () {  },);
                },
              )

            ]
        )
    );
  }
}