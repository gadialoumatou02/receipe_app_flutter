import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:recipe_app/repository/receipe_repository.dart';

class ReceipesWidget extends StatelessWidget {
  const ReceipesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final receipeRepository = GetIt.instance<ReceipeRepository>();
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