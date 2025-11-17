import 'package:flutter/material.dart';

class ReceipesWidget extends StatelessWidget {
  const ReceipesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Receipes"),
      ),
      body: const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text("Welcome")),
    );
  }

}