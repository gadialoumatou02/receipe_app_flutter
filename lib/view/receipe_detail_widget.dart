import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:recipe_app/presenter/receipe_modification.dart';
import 'package:recipe_app/view/image_modif_widget.dart';
import '../data/receipe.dart';

class ReceipeDetailWidget extends StatefulWidget {
  final Receipe receipe;
  const ReceipeDetailWidget({super.key, required this.receipe});

  @override
  State<ReceipeDetailWidget> createState() => _ReceipeDetailWidgetState();
}

class _ReceipeDetailWidgetState extends State<ReceipeDetailWidget> {
  late RecipeModification modify;
  // Function for state
  void initState() {
    super.initState();
    modify = GetIt.instance<RecipeModification>();
  }
  // Give unity
  String unity(name) {
    if(name == "milk" || name=="liquid cream"){
      return "cl";
    }
    return "g";
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
            )),

      ),
      body: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            // PLace of prep and cook time, button edit receipe
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Text on the left
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Prep ${receipe.time_prep} mins"),
                    const SizedBox(height: 2),
                    Text("Cook ${receipe.time_cook} mins"),
                  ],
                ),
                // Button edit receipe
                ElevatedButton(
                    style:ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple,
                    ),
                    onPressed : () {
                      Navigator.pushNamed(
                        context,
                        '/edit_recipe',
                        arguments: receipe, // on envoie la recette
                      );
                      },
                    child : const Text ("Edit receipe",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),)
                )
              ],
            ),
            const SizedBox(height: 12),
            // PLace of serving, button edit receipe
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Text on the left
                Text("Serving : ${receipe.serving}"),
                const SizedBox(width: 30),

                // Button  modify serving
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,         // fond gris clair
                    borderRadius: BorderRadius.circular(20), // forme "pilule"
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        visualDensity: VisualDensity.compact,
                        onPressed : receipe.serving > 0
                            ? () {
                          setState(() {
                            modify.decreaseServing(receipe,1);
                          });
                        }
                        : null, // button desactivated
                        icon: const Text ("-",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            )
                        ),
                      ),
                      // Trait vertical au milieu
                      Container(
                        width: 1,
                        height: 20,
                        color: Colors.grey,
                      ),
                      // Button add serving
                      IconButton(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        visualDensity: VisualDensity.compact,
                        onPressed : () {
                          setState(() {
                            modify.increaseServing(receipe,1);
                          });
                        },
                        icon: Text ("+",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        )
                        ),
                      ),
                    ],)
                )
              ],
            ),
            const SizedBox(height: 12),

            // PLace of image
            ImageModifWidget(receipe: receipe),

            const SizedBox(height: 12),
            // PLace of list of ingredients
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:[ Text("Ingredients",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      )
                  ),]
                ),
                const SizedBox(height: 3),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: receipe.ingred_list.map((ingredient) {
                    return Padding(
                        padding: const EdgeInsets.all(3),
                        child: Text(
                          "${ingredient['name']} ${ingredient['qty']} ${unity(ingredient['name'])}",
                        )
                    );
                  }).toList()
                )
              ],
            ),

            const SizedBox(height: 12),
            // PLace of directions
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    "Directions",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    )
                ),
                const SizedBox(height: 2),
                Text(receipe.directions.trim(),
                )],
                ),
              ]
            ),

    );
  }

}

