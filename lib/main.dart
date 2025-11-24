import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:recipe_app/data/receipe.dart';
import 'package:recipe_app/presenter/image_modification.dart';
import 'package:recipe_app/presenter/receipe_modification.dart';
import 'package:recipe_app/repository/receipe_repository.dart';
import 'package:recipe_app/repository/receipes_repository_dummy_impl.dart';
import 'package:recipe_app/view/edit_recipe_widget.dart';
import 'package:recipe_app/view/receipe_detail_widget.dart';
import 'package:recipe_app/view/receipes_widget.dart';

void main() {
  GetIt.instance.registerSingleton<ReceipeRepository>(ReceipeRepositoryDummyImpl());
  GetIt.instance.registerSingleton<RecipeModification>(RecipeModification());
  GetIt.instance.registerSingleton<ImageModification>(ImageModification());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Recipes',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),

      initialRoute: '/recipes',
      routes: {
        '/recipes': (context) => const ReceipesWidget(),

        // Route détail : on récupère la recette passée en arguments
        '/details': (context) {
          final receipe = ModalRoute.of(context)!.settings.arguments as Receipe;
          return ReceipeDetailWidget(receipe: receipe);
        },

        // Route edit recipe : on récupère la recette passée en arguments
        '/edit_recipe': (context) {
          final receipe = ModalRoute.of(context)!.settings.arguments as Receipe;
          return EditRecipeWidget(receipe: receipe, shiftServing: (int shift) {  },);
        },
      },
    );
  }
}


