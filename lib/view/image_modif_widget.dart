import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:recipe_app/presenter/image_modification.dart';

import '../data/receipe.dart';
import '../presenter/receipe_modification.dart';
import 'ingredient_view.dart';


class ImageModifWidget extends StatefulWidget {
  final Receipe receipe;
  const ImageModifWidget({super.key, required this.receipe});


  @override
  State<ImageModifWidget> createState() => _ImageModifWidgetState();
}

class _ImageModifWidgetState extends State<ImageModifWidget> {
  late RecipeModification modify;
  // Function for state
  void initState() {
    super.initState();
    modify = GetIt.instance<RecipeModification>();
  }
  // Vue
  @override
  Widget build(BuildContext context) {
    final receipe = widget.receipe;
    return SizedBox(
      width: double.infinity,
      child: Stack(
        children: [
          // Image
          GestureDetector(
            onTap: () async {
              await modify.pickNewImage(receipe);
              setState(() {
              });
            },
            child: ClipRRect(
              child: Image(
                image: modify.pickedImage != null
                    ? FileImage(modify.pickedImage!)
                    : AssetImage(widget.receipe.path_image) as ImageProvider,
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Bouton modif image
          Positioned(
            bottom: 9,
            right: 9,
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.circular(10)
              ),
              child: IconButton(
                icon: const Icon(Icons.image_outlined,
                    color: Colors.white),
                onPressed: () async {
                  await modify.pickNewImage(receipe);
                  setState(() {});
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
