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
                  padding: const EdgeInsets.all(12),
                  margin: const EdgeInsets.symmetric(vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade400,
                    borderRadius: BorderRadius.circular(8),
                  ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(ingredient["name"],
                      style: TextStyle(fontSize: 12, color: Colors.black54,),
                    ),
                    const SizedBox(height: 4),
                    TextFormField(initialValue:ingredient["qty"].toString(),
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600,),
                    ),
                    const SizedBox(width: 8),
                  ]
                )
              )
          ),
          // Bouton rouge avec l'icône poubelle
          FloatingActionButton(
            heroTag: 'delete_${ingredient["name"]}', // tag différent par item
            mini: true,
            backgroundColor: Colors.red,
            onPressed: onRemove,
            child: const Icon(Icons.delete, color: Colors.white, size: 18),
          ),
        ]
      )
    );
  }
}
