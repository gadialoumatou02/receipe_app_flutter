import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:recipe_app/repository/receipe_repository.dart';
import 'package:recipe_app/view/receipe_widget.dart';

class ReceipesWidget extends StatelessWidget {
  const ReceipesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final receipeRepository = GetIt.instance<ReceipeRepository>();
    var list_receipes = receipeRepository.receipes;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Receipes"),
        backgroundColor: Colors.deepPurple
        ),

      body: Column(children: [
        Row(),
        const SizedBox(height: 16),
        Expanded(
          child: ListView.builder(
            itemCount: list_receipes.length,
            itemBuilder: (BuildContext context, int index) {
              return ReceipeWidget(receipe: list_receipes[index]);
            },

          )
        )
      ]),
    );
  }

}
