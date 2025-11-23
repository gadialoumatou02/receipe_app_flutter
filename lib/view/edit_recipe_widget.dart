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
              Text("Prep time",
                style: TextStyle(fontSize: 12, color: Colors.black54,),
              ),
              const SizedBox(height: 4),
              TextFormField(initialValue: "${modify.time_prep}"),
              const SizedBox (height: 16),
              // Time cook
              Text("Cook time",
                style: TextStyle(fontSize: 12, color: Colors.black54,),
              ),
              TextFormField(initialValue: "${modify.time_cook}"),
              const SizedBox (height: 16),
              // Serving
              Text("Serving",
                style: TextStyle(fontSize: 12, color: Colors.black54,),
              ),
              TextFormField(initialValue: "${modify.serving}"),
              const SizedBox (height: 16),
              // Ingredients
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Ingredients",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold
                  ),
                  ),
                  const SizedBox(width: 15),

                  // Button checkbox
                  Row(
                    children: [
                      Checkbox(
                          value: sortByName,
                          activeColor: Colors.deepPurple,
                          checkColor: Colors.white,
                          onChanged: (value) {
                            setState(() {
                              sortByName == value?? false;
                                modify.sortByName();

                            });
                          }),
                      const Text("Sort By Name",
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold
                        ),
                      )
                    ],
                  )
                ],
              ),
              const SizedBox(height: 15),
              // Ingrdients
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: receipe.ingred_list.length,
                itemBuilder: (context, index) {
                  return IngredientViewWidget(
                    ingredient: modify.ingredients[index],
                    onRemove: () {
                      setState(() {
                        modify.removeIngredient(index);
                      });
                    },);
                },
              ),

              // Button adding ingredient
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30), // pilule
                  ),
                ),
                onPressed: () {
                  // ouvrir dialog d'ajout ou autre
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // petit cercle avec +
                    Container(
                      width: 22,
                      height: 22,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 2),
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.add,
                          size: 14,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      "Add ingredient",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              )
            ]
        )
    );
  }
}