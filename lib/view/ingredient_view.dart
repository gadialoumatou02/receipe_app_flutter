import 'package:flutter/material.dart';
import '../data/receipe.dart';

class IngredientViewWidget extends StatelessWidget {
  final Map<String, dynamic> ingredient;
  final VoidCallback onRemove;

  const IngredientViewWidget({super.key, required this.ingredient, required this.onRemove});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          // name + qty
          Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.grey, // adapte la couleur si tu veux
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(ingredient["name"],
                      style: TextStyle(fontSize: 12, color: Colors.black54,),
                    ),
                    const SizedBox(height: 4),
                    Text(ingredient["qty"].toString(),
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600,),
                    ),
                    const SizedBox(width: 8),
                    // Bouton rouge avec l'icône poubelle
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Material(
                            color: Colors.red,
                            shape: const CircleBorder(),
                            child: IconButton(
                              icon: const Icon(Icons.delete, color: Colors.white, size: 18),
                              onPressed: onRemove,
                            )
                        )
                      ],
                    )
                  ]
                )
              )
          )
        ]
      )
    );
  }
}
