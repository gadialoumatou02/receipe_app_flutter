import 'package:flutter/material.dart';
import '../data/receipe.dart';

class ReceipeDetailWidget extends StatelessWidget {
  final Receipe receipe;
  const ReceipeDetailWidget({super.key, required this.receipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(receipe.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Text("Prep Time: ${receipe.time_prep} mins"),
            const SizedBox(width: 16),
            Text("Cook Time: ${receipe.time_cook} mins"),
          ],
        ),
      ),
    );
  }
}

