import 'package:flutter/material.dart';
import '../data/receipe.dart';

class ReceipeWidget extends StatelessWidget {
  final Receipe receipe;

  const ReceipeWidget({super.key, required this.receipe});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Image.asset(
            receipe.path_image,
            width: 120,
            height: 120,
          ),
          const SizedBox(width: 16),
          Expanded(
              child: // Cadrage de la partie texte
              Container(
                padding: const EdgeInsets.all(10.0),
                color: Colors.white54,
                height: 100,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Le nom devient cliquable
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          '/details',
                          arguments: receipe, // on envoie la recette
                        );
                      },
                      child: Text(
                        receipe.name,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text("prep ${receipe.time_prep} mins"),
                    Text("cook ${receipe.time_cook} mins"),
                  ],
                ),
              ),
          ),
        ],
      ),
    );
  }
}
