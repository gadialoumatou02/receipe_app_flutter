import 'package:flutter/material.dart';
import '../data/receipe.dart';

class ReceipeDetailWidget extends StatelessWidget {
  final Receipe receipe;
  final void Function(int shift) shiftServing;
  const ReceipeDetailWidget({super.key, required this.receipe, required this.shiftServing});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            receipe.name,
            style: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold
            )),

      ),
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                      child : const Text ("Edit receipe")
                  )
                ],
              ),
              const SizedBox(height: 12),
              // PLace of serving, button edit receipe
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Text on the left
                  Text("Serving : ${receipe.serving}"),
                  // Button  serving
                  ElevatedButton(
                    onPressed : receipe.serving > 0 ? () {
                      shiftServing(-1);
                    }
                    : null, // button desactivated
                    child : const Text ("-"),
                  ),
                  // Button add serving
                  ElevatedButton(
                    onPressed : () {
                      shiftServing(1);
                    },
                    child : const Text ("+"),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              // PLace of image
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Image
                  Image.asset(
                    receipe.path_image,
                  ),
                  // Button add serving
                ],
              ),
              const SizedBox(height: 12),
              // PLace of list of ingredients
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Ingredients",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      )
                  ),
                  const SizedBox(height: 2),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: receipe.ingred_list.map((ingredient) {
                      return Padding(
                          padding: const EdgeInsets.all(3),
                          child: Text(
                            "${ingredient['name']} ${ingredient['qty']} g",
                          )
                      );
                    }).toList()
                  )
                ],
              ),
              const SizedBox(height: 12),
              // PLace of directions
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Directions",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      )
                  ),
                  const SizedBox(height: 2),
                  Text(receipe.directions),
                ],
              )
            ],
          )
      )
    );
  }
}

