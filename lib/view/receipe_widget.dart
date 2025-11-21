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
            Image.asset(receipe.path_image,width: 60, height: 60,),
            const SizedBox(width: 12),
            Expanded(child: Column(
              children: [
                Text(receipe.name),
                const SizedBox(height: 5),
                Text("prep ${receipe.time_prep} mins"),
                Text("cook ${receipe.time_cook} mins"),
                const SizedBox(width: 16),
              ],
            ))
          ],
        ));
  }

}